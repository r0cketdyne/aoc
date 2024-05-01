//Im definitely going to take syntax from learn zig in x minutes and use it to construct basic implementation herei

// Import standard library, reachable through the "std" constant.
const std = @import("std");

// "info" now refers to the "std.log.info" function.
const info = std.log.info;

// Usual hello world.
// syntax: [pub] fn <function-name>(<arguments>) <return-type> { <body> }
pub fn main() void {
    // Contrary to C functions, Zig functions have a fixed number of arguments.
    // In C: "printf" takes any number of arguments.
    // In Zig: std.log.info takes a format and a list of elements to print.
    info("hello world", .{});  // .{} is an empty anonymous tuple.
}
