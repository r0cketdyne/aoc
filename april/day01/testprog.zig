const std = @import("std");
const Allocator = std.mem.Allocator;
const IO = std.io;
const HTTP = std.net.http;

pub fn main() !void {
    // Initialize a page allocator to manage memory allocation
    const allocator = std.heap.page_allocator;

    // Fetch the content of the webpage
    const pageContent = try getPageContent(allocator, "https://adventofcode.com/2023/day/1/input");

    // Log the entire webpage content to standard output
    try IO.stdout.print("{}", .{pageContent});
}

// Function to fetch the content of a webpage
fn getPageContent(allocator: *Allocator, url: []const u8) ![]const u8 {
    // Initialize a HTTP request object
    var request = HTTP.Request.init(allocator, .{});
    request.method = "GET";
    request.url = url;

    // Initialize a HTTP client
    const client = HTTP.Client.init(allocator);

    // Send the HTTP request and get the response
    const response = try client.request(request);

    // Check if the response status code indicates success (200 OK)
    if (response.statusCode != 200) {
        // If not successful, return null indicating failure
        return null;
    }

    // Return the body of the HTTP response, which contains the webpage content
    return response.body;
}
//so, here I am planning on simply scraiping a webpage with something similar to curl; and will replace the URL with the aoc text file address for scraping
//nothing will be iterated at line by line yet, just figuring out how to do this in general and what the code looks like before refining the implementation
