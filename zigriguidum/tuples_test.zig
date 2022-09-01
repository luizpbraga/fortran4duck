//
const std = @import("std");
const print = std.debug.print;
//
const expect = std.testing.expect;

test "Tuple" {
    const t = .{ @as(u8, 1), @as(f64, 3.14) } ++ .{"ola"} ** 3;

    try expect( //
        t.@"0" == 1 and
        t.@"1" == 3.14 and
        t.@"2" == "ola" and
        t.@"3".len == 3 and
        t.@"4"[0] == 'o' //
    );

    // Look It!
    print("\n{d} {d} {s} {s} {s}\n", t);
    // Did not get it? look again.    _|_
}
