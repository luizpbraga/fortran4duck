//
const std = @import("std");

const print = std.debug.print;
//

test "for" {
    const f = b1: for ([_]u8{0} ** 10) |val| {
        var i: usize = 0;
        if (i == 10) break :b1 val;
        i += 1;
    } else 1;

    try std.testing.expect(f == 1);
}

test "if" {
    const f = if (true) 1 else 0;
    try std.testing.expect(f == 1);
}
