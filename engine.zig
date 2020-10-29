const std=@import("std");
const assert=std.debug.assert;

const numTiles=9;
const winningRows=[_][3]u8{[_]u8{0,1,2},
                           [_]u8{3,4,5},
                           [_]u8{6,7,8},
                           [_]u8{0,3,6},
                           [_]u8{1,4,7},
                           [_]u8{2,5,8},
                           [_]u8{0,4,8},
                           [_]u8{2,4,6}};
const Score=enum{
    playerOneWin=0,
    draw=1,
    playerTwoWin=2,
};
const Evaluation=struct{
    outcomeWithBestPlay:Score,
    bestMove:usize,
};

//Valid values for tile state are 0=Empty, 1=Player One, 2=Player Two. However, we encode the board in full bytes to keep the api simple.
const TileState=u8;
pub const Board=[numTiles]TileState;

fn emptyTiles(board:Board)bool{
    for(board)|tile|{
        if(tile==0)
            return true;
    }
    return false;
}

pub fn isGameOver(board:Board)?Score{
    for(winningRows)|row|{
        isOneWinning:{
            for(row)|pos|{
                if(board[pos]!=1)
                    break :isOneWinning;
            }
            return .playerOneWin;
        }
        isTwoWinning:{
            for(row)|pos|{
                if(board[pos]!=2)
                    break :isTwoWinning;
            }
            return .playerTwoWin;
        }
    }
    if(emptyTiles(board))
        return null;
    return .draw;
}

pub fn evaluatePosition(board:Board,curPlayer:u8)Evaluation{
    assert(emptyTiles(board));
    assert(isGameOver(board)==null);
    var bestScore:Score=if(curPlayer==1)
        .playerTwoWin
        else
        .playerOneWin;
    var bestPos:usize=undefined;//This value is guaranteed to be overwritten, since we confirmed an empty tile exists.
    for(board)|tile,i|{
        if(tile==0){
            var newBoard=board;
            updateBoard(&newBoard,curPlayer,i);
            var newScore:Score=undefined;
            if(isGameOver(newBoard))|score|{
                newScore=score;
            }else
                newScore=evaluatePosition(newBoard,3-curPlayer).outcomeWithBestPlay;
            const improvement=
                if(curPlayer==1)//Player one wants lower score, player two higher score, as per minimax strategy
                @enumToInt(newScore)<=@enumToInt(bestScore)
                else
                @enumToInt(newScore)>=@enumToInt(bestScore);
            if(improvement){
                bestPos=i;
                bestScore=newScore;
            }
        }
    }
    return .{
        .outcomeWithBestPlay=bestScore,
        .bestMove=bestPos,
    };
}

pub fn validMove(board:Board,pos:usize)bool{
    return pos<=8 and (board[pos]==0);
}

pub fn updateBoard(board:*Board,curPlayer:u8,pos:usize)void{
    assert(curPlayer==1 or curPlayer==2);
    assert(board[pos]==0);
    board[pos]=curPlayer;
}
