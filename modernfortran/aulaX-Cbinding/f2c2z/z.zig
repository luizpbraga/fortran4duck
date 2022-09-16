//
const std = @import("std");
const print = std.debug.print;
// Fortran -> C -> ZIG
const f2c = @cImport(@cInclude("/home/luizpbraga/Github/fortran4duck/modernfortran/aulaX-Cbinding/f2c/mylib.h"));
//
pub fn main() !void {
    print("{}", .{f2c.add(1, 1)});
    var a: c_int = 1;
    var b: c_int = 2;
    _ = f2c.swap(&a, &b);
    try std.testing.expect(b == 1 and a == 2);
}
