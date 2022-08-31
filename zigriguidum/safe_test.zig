//
const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;

const Foo = struct {
    const This = @This();
    var u: usize = 0;

    e: [4:0]u8,

    fn next(this: This) ?u8 {
        defer u += 1;
        return if (u > this.e.len) null else this.e[u];
    }
};

test "orelse" {
    const t1: ?i32 = -0;
    const notnul = t1.?;
    try expect(notnul == 0);
    //
    //
    var t2 = Foo{ .e = .{ 1, 2, 3, 4 } };
    while (t2.next()) |val| {
        print("{d}\n", .{val});
    }
    //
}
