const std = @import("std");
pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Digita um numero ai folgado: ", .{});
    const number = try getNumberTerminal();
    std.debug.print("Numero: {d}", .{number});
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
