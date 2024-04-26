//We will start by reading the input and parsing it into a data structure that represents the connections between components.

const std = @import("std");// in zig, we are importing some standard libs. to do that, we need to make variables at the stack, and make them consts, which are unchanged during prog execution
const io = std.io; //here we are importing yet another lib, standard i/o like in c bc we actually need something to log to the terminal emulator here, or the "screen"
const mem = std.mem; //not sure exactly what this standard lib does, but think it has something to do with memory. will update this comment later

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

