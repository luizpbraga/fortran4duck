const std = @import("std");

pub fn main() void {
    const file = @embedFile("./readafile.zig");

    var iter = std.mem.split(u8, file, "\n");

    var i: usize = 1;
    while (iter.next()) |line| : (i += 1) {
        std.debug.print("{d} {s}\n", .{ i, line });
    }
}
// End!!
