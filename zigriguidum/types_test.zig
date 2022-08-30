//
const std = @import("std");
const expect = std.testing.expect;
const sqrt = std.math.sqrt;
const pow = std.math.pow;
//

const @"2dPoint" = struct { x: f32, y: f32 };

const @"3dPoint" = struct { x: f32, y: f32, z: f32 };

// Tag Union
const Posi = union(enum) {
    @"2D": @"2dPoint",
    @"3D": @"3dPoint",
};

const Point = struct {
    const This = @This();

    p: Posi,

    fn norm(this: This) f32 {
        switch (this.p) {
            .@"2D" => |p| {
                return sqrt(pow(f32, p.x, 2.0) + pow(f32, p.y, 2.0));
            },
            .@"3D" => |p| {
                return sqrt(pow(f32, p.x, 2.0) + pow(f32, p.y, 2.0) + pow(f32, p.z, 2.0));
            },
        }
    }
};

test "norm" {
    // Nice!!!!!!
    const point = Point{ .p = .{ .@"2D" = .{ .x = 1.0, .y = 1.0 } } };

    try expect(point.norm() == std.math.sqrt2);
}
