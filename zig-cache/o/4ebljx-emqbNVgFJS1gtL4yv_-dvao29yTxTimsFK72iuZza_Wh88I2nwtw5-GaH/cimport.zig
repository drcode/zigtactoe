pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
const struct_unnamed_1 = extern struct {
    __val: [2]c_int,
};
pub const __fsid_t = struct_unnamed_1;
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*c_void;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const clock_t = __clock_t;
pub const time_t = __time_t;
pub const struct_tm = extern struct {
    tm_sec: c_int,
    tm_min: c_int,
    tm_hour: c_int,
    tm_mday: c_int,
    tm_mon: c_int,
    tm_year: c_int,
    tm_wday: c_int,
    tm_yday: c_int,
    tm_isdst: c_int,
    tm_gmtoff: c_long,
    tm_zone: [*c]const u8,
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t,
    tv_nsec: __syscall_slong_t,
};
pub const clockid_t = __clockid_t;
pub const timer_t = __timer_t;
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec,
    it_value: struct_timespec,
};
pub const struct_sigevent = @Type(.Opaque);
pub const pid_t = __pid_t;
pub const struct___locale_data = @Type(.Opaque);
pub const struct___locale_struct = extern struct {
    __locales: [13]?*struct___locale_data,
    __ctype_b: [*c]const c_ushort,
    __ctype_tolower: [*c]const c_int,
    __ctype_toupper: [*c]const c_int,
    __names: [13][*c]const u8,
};
pub const __locale_t = [*c]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn clock() clock_t;
pub extern fn time(__timer: [*c]time_t) time_t;
pub extern fn difftime(__time1: time_t, __time0: time_t) f64;
pub extern fn mktime(__tp: [*c]struct_tm) time_t;
pub extern fn strftime(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm) usize;
pub extern fn strftime_l(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm, __loc: locale_t) usize;
pub extern fn gmtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn localtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn gmtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn asctime(__tp: [*c]const struct_tm) [*c]u8;
pub extern fn ctime(__timer: [*c]const time_t) [*c]u8;
pub extern fn asctime_r(noalias __tp: [*c]const struct_tm, noalias __buf: [*c]u8) [*c]u8;
pub extern fn ctime_r(noalias __timer: [*c]const time_t, noalias __buf: [*c]u8) [*c]u8;
pub extern var __tzname: [2][*c]u8;
pub extern var __daylight: c_int;
pub extern var __timezone: c_long;
pub extern var tzname: [2][*c]u8;
pub extern fn tzset() void;
pub extern var daylight: c_int;
pub extern var timezone: c_long;
pub extern fn timegm(__tp: [*c]struct_tm) time_t;
pub extern fn timelocal(__tp: [*c]struct_tm) time_t;
pub extern fn dysize(__year: c_int) c_int;
pub extern fn nanosleep(__requested_time: [*c]const struct_timespec, __remaining: [*c]struct_timespec) c_int;
pub extern fn clock_getres(__clock_id: clockid_t, __res: [*c]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn clock_settime(__clock_id: clockid_t, __tp: [*c]const struct_timespec) c_int;
pub extern fn clock_nanosleep(__clock_id: clockid_t, __flags: c_int, __req: [*c]const struct_timespec, __rem: [*c]struct_timespec) c_int;
pub extern fn clock_getcpuclockid(__pid: pid_t, __clock_id: [*c]clockid_t) c_int;
pub extern fn timer_create(__clock_id: clockid_t, noalias __evp: ?*struct_sigevent, noalias __timerid: [*c]timer_t) c_int;
pub extern fn timer_delete(__timerid: timer_t) c_int;
pub extern fn timer_settime(__timerid: timer_t, __flags: c_int, noalias __value: [*c]const struct_itimerspec, noalias __ovalue: [*c]struct_itimerspec) c_int;
pub extern fn timer_gettime(__timerid: timer_t, __value: [*c]struct_itimerspec) c_int;
pub extern fn timer_getoverrun(__timerid: timer_t) c_int;
pub extern fn timespec_get(__ts: [*c]struct_timespec, __base: c_int) c_int;
pub const __INTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):62:9
pub const __UINTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):66:9
pub const __PTRDIFF_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):73:9
pub const __INTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):77:9
pub const __SIZE_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):81:9
pub const __UINTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):96:9
pub const __INT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):159:9
pub const __UINT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):187:9
pub const __INT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):225:9
pub const __UINT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):229:9
pub const __INT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // (no file):265:9
pub const __UINT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_unsigned"); // (no file):269:9
pub const __GLIBC_USE = @compileError("unable to translate C expr: unexpected token .HashHash"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/features.h:179:9
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token .HashHash"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:105:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token .Hash"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:106:9
pub const __ptr_t = @compileError("unable to translate C expr: unexpected token .Nl"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:109:9
pub const __warndecl = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:133:10
pub const __warnattr = @compileError("unable to translate C expr: unexpected token .Nl"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:134:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:135:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token .LBracket"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:143:10
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token .Hash"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:174:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token .Hash"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:181:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token .Hash"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:183:11
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token .Nl"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:219:10
pub const __extern_inline = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:346:11
pub const __extern_always_inline = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:347:11
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token .Nl"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:441:10
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token .Nl"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:512:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token .Nl"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:513:10
pub const __glibc_macro_warning1 = @compileError("unable to translate C expr: unexpected token .Hash"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:527:10
pub const __attr_access = @compileError("unable to translate C expr: unexpected token .Nl"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/sys/cdefs.h:559:11
pub const __S16_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:109:9
pub const __U16_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:110:9
pub const __SLONGWORD_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:113:9
pub const __ULONGWORD_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:114:9
pub const __SQUAD_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:128:10
pub const __UQUAD_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:129:10
pub const __SWORD_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:130:10
pub const __UWORD_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:131:10
pub const __S64_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:134:10
pub const __U64_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_int"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:135:10
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_typedef"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/generic-glibc/bits/types.h:137:10
pub const __TIMER_T_TYPE = @compileError("unable to translate C expr: unexpected token .Nl"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/x86_64-linux-gnu/bits/typesizes.h:71:9
pub const __FSID_T_TYPE = @compileError("unable to translate C expr: unexpected token .Keyword_struct"); // /home/drcode/zigtactoe/zig-linux-x86_64-0.6.0+17f36566d/lib/zig/libc/include/x86_64-linux-gnu/bits/typesizes.h:73:9
pub const __llvm__ = 1;
pub const __clang__ = 1;
pub const __clang_major__ = 10;
pub const __clang_minor__ = 0;
pub const __clang_patchlevel__ = 0;
pub const __clang_version__ = "10.0.0 ";
pub const __GNUC__ = 4;
pub const __GNUC_MINOR__ = 2;
pub const __GNUC_PATCHLEVEL__ = 1;
pub const __GXX_ABI_VERSION = 1002;
pub const __ATOMIC_RELAXED = 0;
pub const __ATOMIC_CONSUME = 1;
pub const __ATOMIC_ACQUIRE = 2;
pub const __ATOMIC_RELEASE = 3;
pub const __ATOMIC_ACQ_REL = 4;
pub const __ATOMIC_SEQ_CST = 5;
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const __VERSION__ = "Clang 10.0.0 ";
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const __OPTIMIZE__ = 1;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = 1;
pub const _LP64 = 1;
pub const __LP64__ = 1;
pub const __CHAR_BIT__ = 8;
pub const __SCHAR_MAX__ = 127;
pub const __SHRT_MAX__ = 32767;
pub const __INT_MAX__ = 2147483647;
pub const __LONG_MAX__ = @as(c_long, 9223372036854775807);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = 2147483647;
pub const __WINT_MAX__ = @as(c_uint, 4294967295);
pub const __INTMAX_MAX__ = @as(c_long, 9223372036854775807);
pub const __SIZE_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __UINTMAX_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __PTRDIFF_MAX__ = @as(c_long, 9223372036854775807);
pub const __INTPTR_MAX__ = @as(c_long, 9223372036854775807);
pub const __UINTPTR_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __SIZEOF_DOUBLE__ = 8;
pub const __SIZEOF_FLOAT__ = 4;
pub const __SIZEOF_INT__ = 4;
pub const __SIZEOF_LONG__ = 8;
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const __SIZEOF_POINTER__ = 8;
pub const __SIZEOF_SHORT__ = 2;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const __SIZEOF_SIZE_T__ = 8;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const __SIZEOF_WINT_T__ = 4;
pub const __SIZEOF_INT128__ = 16;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __INTMAX_WIDTH__ = 64;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __PTRDIFF_WIDTH__ = 64;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __INTPTR_WIDTH__ = 64;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __SIZE_WIDTH__ = 64;
pub const __WCHAR_TYPE__ = c_int;
pub const __WCHAR_WIDTH__ = 32;
pub const __WINT_TYPE__ = c_uint;
pub const __WINT_WIDTH__ = 32;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTMAX_WIDTH__ = 64;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __UINTPTR_WIDTH__ = 64;
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = 1;
pub const __FLT_DIG__ = 6;
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = 1;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __FLT_MANT_DIG__ = 24;
pub const __FLT_MAX_10_EXP__ = 38;
pub const __FLT_MAX_EXP__ = 128;
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -37;
pub const __FLT_MIN_EXP__ = -125;
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
pub const __DBL_HAS_DENORM__ = 1;
pub const __DBL_DIG__ = 15;
pub const __DBL_DECIMAL_DIG__ = 17;
pub const __DBL_EPSILON__ = 2.2204460492503131e-16;
pub const __DBL_HAS_INFINITY__ = 1;
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const __DBL_MANT_DIG__ = 53;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __DBL_MAX_EXP__ = 1024;
pub const __DBL_MAX__ = 1.7976931348623157e+308;
pub const __DBL_MIN_10_EXP__ = -307;
pub const __DBL_MIN_EXP__ = -1021;
pub const __DBL_MIN__ = 2.2250738585072014e-308;
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = 1;
pub const __LDBL_DIG__ = 18;
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const __LDBL_MANT_DIG__ = 64;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __LDBL_MAX_EXP__ = 16384;
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const __LDBL_MIN_EXP__ = -16381;
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = 64;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const __WINT_UNSIGNED__ = 1;
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = L;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_MAX__ = 255;
pub const __INT8_MAX__ = 127;
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_MAX__ = 65535;
pub const __INT16_MAX__ = 32767;
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = U;
pub const __UINT32_MAX__ = @as(c_uint, 4294967295);
pub const __INT32_MAX__ = 2147483647;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = UL;
pub const __UINT64_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_long, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = 127;
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = 255;
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = 32767;
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = 65535;
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @as(c_uint, 4294967295);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_MAX__ = @as(c_long, 9223372036854775807);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = 127;
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = 255;
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = 32767;
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = 65535;
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = 2147483647;
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @as(c_uint, 4294967295);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_MAX__ = @as(c_long, 9223372036854775807);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_MAX__ = @as(c_ulong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __FINITE_MATH_ONLY__ = 0;
pub const __GNUC_STDC_INLINE__ = 1;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __PIC__ = 2;
pub const __pic__ = 2;
pub const __FLT_EVAL_METHOD__ = 0;
pub const __FLT_RADIX__ = 2;
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = 2;
pub const __GCC_ASM_FLAG_OUTPUTS__ = 1;
pub const __code_model_small_ = 1;
pub const __amd64__ = 1;
pub const __amd64 = 1;
pub const __x86_64 = 1;
pub const __x86_64__ = 1;
pub const __SEG_GS = 1;
pub const __SEG_FS = 1;
pub const __seg_gs = __attribute__(address_space(256));
pub const __seg_fs = __attribute__(address_space(257));
pub const __goldmont_plus = 1;
pub const __goldmont_plus__ = 1;
pub const __tune_goldmont_plus__ = 1;
pub const __NO_MATH_INLINES = 1;
pub const __AES__ = 1;
pub const __PCLMUL__ = 1;
pub const __RDRND__ = 1;
pub const __FSGSBASE__ = 1;
pub const __POPCNT__ = 1;
pub const __PRFCHW__ = 1;
pub const __RDSEED__ = 1;
pub const __MOVBE__ = 1;
pub const __SHA__ = 1;
pub const __FXSR__ = 1;
pub const __CLFLUSHOPT__ = 1;
pub const __SGX__ = 1;
pub const __RDPID__ = 1;
pub const __PTWRITE__ = 1;
pub const __SSE4_2__ = 1;
pub const __SSE4_1__ = 1;
pub const __SSSE3__ = 1;
pub const __SSE3__ = 1;
pub const __SSE2__ = 1;
pub const __SSE2_MATH__ = 1;
pub const __SSE__ = 1;
pub const __SSE_MATH__ = 1;
pub const __MMX__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = 1;
pub const __SIZEOF_FLOAT128__ = 16;
pub const unix = 1;
pub const __unix = 1;
pub const __unix__ = 1;
pub const linux = 1;
pub const __linux = 1;
pub const __linux__ = 1;
pub const __ELF__ = 1;
pub const __gnu_linux__ = 1;
pub const __FLOAT128__ = 1;
pub const __STDC__ = 1;
pub const __STDC_HOSTED__ = 1;
pub const __STDC_VERSION__ = @as(c_long, 201112);
pub const __STDC_UTF_16__ = 1;
pub const __STDC_UTF_32__ = 1;
pub const _DEBUG = 1;
pub const _TIME_H = 1;
pub const _FEATURES_H = 1;
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf((__GNUC__ << 16) + @boolToInt(__GNUC_MINOR__ >= ((maj << 16) + min))) {
    return (__GNUC__ << 16) + @boolToInt(__GNUC_MINOR__ >= ((maj << 16) + min));
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf((__clang_major__ << 16) + @boolToInt(__clang_minor__ >= ((maj << 16) + min))) {
    return (__clang_major__ << 16) + @boolToInt(__clang_minor__ >= ((maj << 16) + min));
}
pub const _DEFAULT_SOURCE = 1;
pub const __GLIBC_USE_ISOC2X = 0;
pub const __USE_ISOC11 = 1;
pub const __USE_ISOC99 = 1;
pub const __USE_ISOC95 = 1;
pub const __USE_POSIX_IMPLICITLY = 1;
pub const _POSIX_SOURCE = 1;
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = 1;
pub const __USE_POSIX2 = 1;
pub const __USE_POSIX199309 = 1;
pub const __USE_POSIX199506 = 1;
pub const __USE_XOPEN2K = 1;
pub const __USE_XOPEN2K8 = 1;
pub const _ATFILE_SOURCE = 1;
pub const __USE_MISC = 1;
pub const __USE_ATFILE = 1;
pub const __USE_FORTIFY_LEVEL = 0;
pub const __GLIBC_USE_DEPRECATED_GETS = 0;
pub const __GLIBC_USE_DEPRECATED_SCANF = 0;
pub const _STDC_PREDEF_H = 1;
pub const __STDC_IEC_559__ = 1;
pub const __STDC_IEC_559_COMPLEX__ = 1;
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = 6;
pub const __GLIBC__ = 2;
pub const __GLIBC_MINOR__ = 32;
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf((__GLIBC__ << 16) + @boolToInt(__GLIBC_MINOR__ >= ((maj << 16) + min))) {
    return (__GLIBC__ << 16) + @boolToInt(__GLIBC_MINOR__ >= ((maj << 16) + min));
}
pub const _SYS_CDEFS_H = 1;
pub const __THROW = __attribute__(__nothrow__ ++ __LEAF);
pub const __THROWNL = __attribute__(__nothrow__);
pub inline fn __NTH(fct: anytype) @TypeOf(__attribute__(__nothrow__ ++ __LEAF) ++ fct) {
    return __attribute__(__nothrow__ ++ __LEAF) ++ fct;
}
pub inline fn __NTHNL(fct: anytype) @TypeOf(__attribute__(__nothrow__) ++ fct) {
    return __attribute__(__nothrow__) ++ fct;
}
pub inline fn __glibc_clang_has_extension(ext: anytype) @TypeOf(__has_extension(ext)) {
    return __has_extension(ext);
}
pub inline fn __P(args: anytype) @TypeOf(args) {
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    return args;
}
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > 1)) {
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > 1);
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, 0)) {
    return __builtin_object_size(ptr, 0);
}
pub const __glibc_c99_flexarr_available = 1;
pub inline fn __ASMNAME(cname: anytype) @TypeOf(__ASMNAME2(__USER_LABEL_PREFIX__, cname)) {
    return __ASMNAME2(__USER_LABEL_PREFIX__, cname);
}
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    return __STRING(prefix) ++ cname;
}
pub const __attribute_malloc__ = __attribute__(__malloc__);
pub const __attribute_pure__ = __attribute__(__pure__);
pub const __attribute_const__ = __attribute__(__const__);
pub const __attribute_used__ = __attribute__(__used__);
pub const __attribute_noinline__ = __attribute__(__noinline__);
pub const __attribute_deprecated__ = __attribute__(__deprecated__);
pub inline fn __attribute_deprecated_msg__(msg: anytype) @TypeOf(__attribute__(__deprecated__(msg))) {
    return __attribute__(__deprecated__(msg));
}
pub inline fn __attribute_format_arg__(x: anytype) @TypeOf(__attribute__(__format_arg__(x))) {
    return __attribute__(__format_arg__(x));
}
pub inline fn __attribute_format_strfmon__(a: anytype, b: anytype) @TypeOf(__attribute__(__format__(__strfmon__, a, b))) {
    return __attribute__(__format__(__strfmon__, a, b));
}
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute__(__nonnull__ ++ params)) {
    return __attribute__(__nonnull__ ++ params);
}
pub const __attribute_warn_unused_result__ = __attribute__(__warn_unused_result__);
pub const __always_inline = __inline ++ __attribute__(__always_inline__);
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __restrict_arr = __restrict;
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, 0)) {
    return __builtin_expect(cond, 0);
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, 1)) {
    return __builtin_expect(cond, 1);
}
pub inline fn __glibc_has_attribute(attr: anytype) @TypeOf(__has_attribute(attr)) {
    return __has_attribute(attr);
}
pub const __WORDSIZE = 64;
pub const __WORDSIZE_TIME64_COMPAT32 = 1;
pub const __SYSCALL_WORDSIZE = 64;
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = 0;
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ (proto ++ __THROW)) {
    return name ++ (proto ++ __THROW);
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ (proto ++ __THROW)) {
    return name ++ (proto ++ __THROW);
}
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    return __REDIRECT_NTH(name, proto, alias);
}
pub inline fn __glibc_macro_warning(message: anytype) @TypeOf(__glibc_macro_warning1(GCC ++ (warning ++ message))) {
    return __glibc_macro_warning1(GCC ++ (warning ++ message));
}
pub const __HAVE_GENERIC_SELECTION = 1;
pub const __USE_EXTERN_INLINES = 1;
pub const NULL = (@import("std").meta.cast(?*c_void, 0));
pub const _BITS_TIME_H = 1;
pub const _BITS_TYPES_H = 1;
pub const __TIMESIZE = __WORDSIZE;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const _BITS_TYPESIZES_H = 1;
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = 1;
pub const __INO_T_MATCHES_INO64_T = 1;
pub const __RLIM_T_MATCHES_RLIM64_T = 1;
pub const __STATFS_MATCHES_STATFS64 = 1;
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = 1;
pub const __FD_SETSIZE = 1024;
pub const _BITS_TIME64_H = 1;
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const CLOCKS_PER_SEC = (@import("std").meta.cast(__clock_t, 1000000));
pub const CLOCK_REALTIME = 0;
pub const CLOCK_MONOTONIC = 1;
pub const CLOCK_PROCESS_CPUTIME_ID = 2;
pub const CLOCK_THREAD_CPUTIME_ID = 3;
pub const CLOCK_MONOTONIC_RAW = 4;
pub const CLOCK_REALTIME_COARSE = 5;
pub const CLOCK_MONOTONIC_COARSE = 6;
pub const CLOCK_BOOTTIME = 7;
pub const CLOCK_REALTIME_ALARM = 8;
pub const CLOCK_BOOTTIME_ALARM = 9;
pub const CLOCK_TAI = 11;
pub const TIMER_ABSTIME = 1;
pub const __clock_t_defined = 1;
pub const __time_t_defined = 1;
pub const __struct_tm_defined = 1;
pub const _STRUCT_TIMESPEC = 1;
pub const _BITS_ENDIAN_H = 1;
pub const __LITTLE_ENDIAN = 1234;
pub const __BIG_ENDIAN = 4321;
pub const __PDP_ENDIAN = 3412;
pub const _BITS_ENDIANNESS_H = 1;
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    return blk: {
        _ = LO;
        break :blk HI;
    };
}
pub const __clockid_t_defined = 1;
pub const __timer_t_defined = 1;
pub const __itimerspec_defined = 1;
pub const _BITS_TYPES_LOCALE_T_H = 1;
pub const _BITS_TYPES___LOCALE_T_H = 1;
pub const TIME_UTC = 1;
pub inline fn __isleap(year: anytype) @TypeOf(year % @boolToInt(4 == @boolToInt((0 != 0) and (year % @boolToInt(100 != @boolToInt((0 != 0) or (year % @boolToInt(400 == 0) != 0))) != 0)))) {
    return year % @boolToInt(4 == @boolToInt((0 != 0) and (year % @boolToInt(100 != @boolToInt((0 != 0) or (year % @boolToInt(400 == 0) != 0))) != 0)));
}
pub const tm = struct_tm;
pub const timespec = struct_timespec;
pub const itimerspec = struct_itimerspec;
pub const sigevent = struct_sigevent;
pub const __locale_data = struct___locale_data;
pub const __locale_struct = struct___locale_struct;
