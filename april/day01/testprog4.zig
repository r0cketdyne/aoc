const std = @import("std");
const Allocator = std.mem.Allocator;
const process = std.process;
const IO = std.io;

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const url = "https://adventofcode.com/2023/day/1/input";
    
    // Execute curl command to fetch webpage content
    const processResult = try process.spawnProcessAndWait(
        allocator,
        "curl",
        &[_][]const u8{"curl", "-s", url},
        .{});
    
    // Check if curl was executed successfully
    if (processResult.status != 0) {
        try IO.stderr.print("Error executing curl: {}\n", .{processResult.status});
        return;
    }
    
    // Read the output of curl process and print it to standard output
    var buffer: [4096]u8 = undefined;
    while (try processResult.stdoutReader.read(buffer[0..])) |bytesRead| {
        try IO.stdout.print("{}", .{buffer[0..bytesRead]});
    }
}

