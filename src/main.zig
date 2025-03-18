const std = @import("std");
const ArrayList = std.ArrayList;
const page_allocator = std.heap.page_allocator;

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var number: i64 = 0;
    var count: i64 = 1;
    var list = ArrayList(i64).init(page_allocator);

    while (number != -1) {
        try stdout.print("Digite numero {d}: ", .{count});
        number = try getNumberTerminal();
        try list.append(number);
        count += 1;
    }

    for (list.items) |num| {
        std.debug.print("Numero: {d}\n", .{num});
    }
}

pub fn getNumberTerminal() !i64 {
    const stdin = std.io.getStdIn().reader();

    const amountBytes = 10;
    var buffer: [amountBytes]u8 = undefined;

    const input = try stdin.readUntilDelimiter(&buffer, '\r');
    const fmt_input = std.mem.trimRight(u8, input, "\n");
    const number = try std.fmt.parseInt(i64, fmt_input, amountBytes);

    return number;
}
