//
const std = @import("std");
//

test "for" {
    var i: usize = 0;
    const t1 = for ([_]u8{0} ** 10) |val| {
        if (i == 5) break val;
        i += 1;
    } else 1;

    try std.testing.expect(t1 == 0);
}

test "if" {
    // simple if
    const t1 = if (true) 0 else 1;
    try std.testing.expect(t1 == 0);

    // void if return
    const t3 = if (false) {
        1;
    }; // else 0;

    try std.testing.expect(t3 == {});

    // break and array
    const t2 = [2]u8{ b1: {
        break :b1 0;
    }, b2: {
        break :b2 1;
    } };

    try std.testing.expect(t2[0] == 0 and t2[1] == 1);

    const t4 = if (false) "1" else 0;
    try std.testing.expect(t4 == 0);
}

test "while" {
    var i: usize = 0;
    const t1 = while (i <= 10) : (i += 1) {
        //if (i == 7) break i;
        if (i == 7) break @as(usize, 7); // @as needed
    } else @as(usize, 0);
    try std.testing.expect(t1 == 7);

    i = 0;
    i = for ([_]u0{0} ** 10) |_| {
        i += 1;
    };
    try std.testing.expect(i == 10);

    // comptime eval
    var v: if (true) i32 else u8 = undefined;
    v = if (@TypeOf(v) == i32) -1 else 0;
    try std.testing.expect(v == -1);
    // t2
    //comptime var t2: if (v == -1) u8 else i8 = if (@TypeOf(t2) == u8) @as(u8, 1) else @as(i8, -1);
    //try std.testing.expect(t2 == 1);
}
