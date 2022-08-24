// read a file

const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn main() !void {
    // #1
    const file = try std.fs.cwd().openFile("./set.lua", .{});
    defer file.close();

    const stat = try file.stat();
    var buffer = try Allocator.alloc(std.heap.page_allocator, u8, stat.size);

    _ = try file.read(buffer);

    try std.io.getStdOut().writer().print("{s} ::::::::::::::::: \n", .{buffer});

    // #2

    const allfile = @embedFile("./set.lua");
    try std.io.getStdOut().writer().print("{s} ::::::::::::::::: \n", .{allfile});

    // End!
}
