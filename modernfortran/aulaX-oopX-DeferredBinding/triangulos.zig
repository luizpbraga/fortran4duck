const std = @import("std");

const Tri_eq = struct {
    l: f64,
    fn area(this: @This()) f64 {
        return @sqrt(@as(f64, 3)) * this.l * this.l / 4.0;
    }
};

const Tri_re = struct {
    c1: f64,
    c2: f64,
    h: f64,
    fn area(this: @This()) f64 {
        return this.c1 * this.c2 / 2.0;
    }
};
// vc pode implementar uma interface usando union(enum) or vTables... Eu nao vou fazer isso ai não!
fn printArea(t: anytype) !void {
    // run-time polymorphism, baby
    return if (@hasDecl(@TypeOf(t), "area")) {
        std.debug.print("{d}\n", .{t.area()});
    } else error.NotDeclArea;
}

pub fn main() !void {
    const tre = Tri_re{ .c1 = 8.0, .c2 = 15.0, .h = 17.0 };
    try printArea(tre);
    const teq = Tri_eq{ .l = 12.0 };
    try printArea(teq);

    std.debug.print("Sim, é pra dar erro...\n", .{});
    //
    try printArea(.{
        .x = 1,
    });
}
