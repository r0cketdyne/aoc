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
//this editor has colors right here; which is super cool. emacs is it's own universre, you can live in there but I mean this is simple to use
//so for now; I'll just be using this. maybe I can install some EMACS plugins later to make it a bit better
//but for now it's KAKOUNE


//problem statement:



//1. **Understand the Problem**: The problem provides a set of lines of text, each containing a specific calibration value.
// To find the calibration value for each line, we need to combine the first and last digits in that order to form a two-digit number.
//  Then, we sum up all the calibration values to get the final result.

//2. **Read the Input**: Start by reading the calibration document, which consists of lines of text.

//3. **Process Each Line**: For each line in the document, extract the first and last digits, combine them to form a two-digit number, and add it to a running total.

//4. **Sum Up Calibration Values**: After processing all lines, sum up all the calibration values obtained from each line.

//5. **Output the Result**: Once the sum is calculated, output the final result, which is the sum of all calibration values.

//6. **Solve the Problem**: Implement the steps described above in code to obtain the final solution.
