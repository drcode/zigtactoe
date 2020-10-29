const std=@import("std");
const engine=@import("engine.zig");
const io=std.io;
const fmt=std.fmt;

const out=io.getStdOut().outStream();
const in=io.getStdIn();

fn printBoard(board:engine.Board)!void{
    for(board)|tile,i|{
        try out.print("{}",.{tile});
        if((i+1)%3==0)
            try out.print("\n",.{});
    }
    try out.print("\n",.{});
}

pub fn main()!void{
    var board:engine.Board=undefined;
    for(board)|*tile|{
        tile.*=0;
    }
    while(engine.isGameOver(board)==null){
        try printBoard(board);
        try out.print("Choose a move (0-8):",.{});
        var buf:[20]u8=undefined;
        const len=try in.read(&buf);
        if(len==buf.len) {
            try out.print("Input too long.\n", .{});
            continue;
        }
        const line=std.mem.trimRight(u8,buf[0..len], "\r\n");
        const pos=fmt.parseUnsigned(u8,line,10) catch {
            try out.print("Invalid number.\n", .{});
            continue;
        };
        if(!engine.validMove(board,pos)){
            try out.print("Invalid move.\n", .{});
            continue;
        }
        engine.updateBoard(&board,1,pos);
        try printBoard(board);
        if(engine.isGameOver(board)!=null)
            break;
        const evaluation=engine.evaluatePosition(board,2);
        engine.updateBoard(&board,2,evaluation.bestMove);
    }
    try printBoard(board);
    try out.print("GAME OVER",.{});
}
