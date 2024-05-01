const std = @import("std");
const IO = std.io;

pub fn main() !void {
    const filePath = "puzzleinput.txt";

    // Open the local file
    const file = try std.fs.cwd().openFile(filePath, .{});

    // Read the contents of the file
    var buffer: [4096]u8 = undefined;
    while (try file.read(buffer[0..])) |bytesRead| {
        // Print the contents to standard output
        try IO.stdout.write(buffer[0..bytesRead]);
    }

    // Close the file
    try file.close();
}

