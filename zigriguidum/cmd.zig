const std = @import("std");

pub fn main() !void {

    // allocator
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    const allocator = arena.allocator();

    // args...
    const argv = &[_][]const u8{ "ls", "/home/luizpbraga/Documents/Aulas-Fortran/" };

    const exec = try std.ChildProcess.exec(.{ .allocator = allocator, .argv = argv });

    try std.io.getStdOut().writer().print("{s}", .{exec.stdout});

    // FIM!
}
