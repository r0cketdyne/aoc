const std = @import("std");
const io = std.io;
const mem = std.mem;

// Define a struct to represent a component and its connections
const Component = struct {
    name: []const u8,
    connections: [][]const u8,
};

// Define a function to parse the input file and return a list of components
fn parseInput(file: []const u8) ![]Component {
    var components = []Component{};

    // Open the file
    const file = try io.readFile(file);

    // Split the file contents into lines
    var lines = []const u8 = file.split("\n");

    // Iterate over each line
    var component: ?Component = null;
    for (lines) |line| {
        // Skip empty lines
        if (line.len == 0) continue;

        // Split the line into component name and connections
        var parts = line.split(":");

        // Extract component name
        const name = parts[0];

        // Extract connections
        const connections = parts[1].trim().split(" ");

        // Create a new component struct
        var newComponent: Component = .{
            .name = name,
            .connections = connections,
        };

        // Append the component to the list
        components.append(newComponent);
    }

    return components;
}

