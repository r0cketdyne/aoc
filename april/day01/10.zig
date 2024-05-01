const std = @import("std"); // Import the standard library
const fs = std.fs; // Alias for the filesystem module
const print = std.debug.print; // Alias for the print function

pub fn main()!void { // Define the main function, which returns an error union
    var gpa = std.heap.GeneralPurposeAllocator(.{}){}; // Initialize a general-purpose allocator
    defer _ = gpa.deinit(); // Ensure the allocator is deinitialized when done
    const allocator = gpa.allocator(); // Get the allocator instance

    const file_path = "puzzleinput.txt"; // Specify the path to the input file
    const file = try fs.cwd().openFile(file_path,.{}); // Open the file, handling errors with try
    defer file.close(); // Ensure the file is closed when done

    var buf_reader = std.io.bufferedReader(file.reader()); // Create a buffered reader for efficiency
    const reader = buf_reader.reader(); // Get the underlying reader

    var line = std.ArrayList(u8).init(allocator); // Initialize an ArrayList to hold each line
    defer line.deinit(); // Ensure the ArrayList is deinitialized when done

    const writer = line.writer(); // Get a writer for the ArrayList
    var line_no: usize = 1; // Initialize a counter for the line numbers

    // Read the file line by line, stopping at the end of the stream
    while (reader.streamUntilDelimiter(writer, '\n', null)) : (line_no += 1) {
        defer line.clearRetainingCapacity(); // Clear the ArrayList to prepare for the next line

        // Print the line number and the line itself
        print("{d}: {s}\n",.{ line_no, line.items });
    } else |err| switch (err) {
        error.EndOfStream => {}, // If we reach the end of the stream, do nothing
        else => return err, // If any other error occurs, propagate it
    }
}

