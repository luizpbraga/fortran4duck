const std = @import("std");

const Poli2 = struct {
    const This = @This();
    const V2 = @Vector(2, f32);

    coef: @Vector(3, f32),

    fn add(self: *This, other: *This) This {
        return .{ .coef = self.coef + other.coef };
    }

    fn root(self: *This) !V2 {
        const a = self.coef[0];
        const b = self.coef[1];
        const c = self.coef[2];
        const delta = b * b - 4.0 * a * c;

        return if (delta < 0)
            error.ComplexRoots
        else
            V2{
                (-b + @sqrt(delta)) / (2 * a),
                (-b - @sqrt(delta)) / (2 * a),
            };
    }
};

//
pub fn main() !void {
    var v = Poli2{ .coef = .{ 1, 0, -25 } };
    std.debug.print("{d}", .{try v.root()});

    var p = v.add(&v);
    std.debug.print("{d}", .{try p.root()});
}
