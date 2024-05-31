const std = @import("std");

fn findFirstDigitFromFront(comptime []const line: []u8) i32 {
    var i: usize = 0;
    while (i < line.len) : (i += 1) {
        if (line[i].isDigit()) {
            return line[i] - '0';
        }
    }
    return -1; // Return -1 if no digit is found
}

fn findFirstDigitFromBack(comptime []const line: []u8) i32 {
    var i: usize = line.len - 1;
    while (i > 0) : (i -= 1) {
        if (line[i].isDigit()) {
            return line[i] - '0';
        }
    }
    return -1; // Return -1 if no digit is found
}

pub fn main() void {
    const file_path = "puzzleinput.txt";
    var file = std.fs.openFile(file_path,.{.mode =.Read });
    if (!file.isOpen()) {
        std.debug.warn("Error: File '{}' does not exist.\n",.{file_path});
        return;
    }

    var total_sum: i32 = 0;

    while (true) {
        var line = file.readLine();
        if (line.len == 0) {
            break;
        }

        var stripped_line = std.mem.trim(u8, line, ' ');
        if (stripped_line.len!= 0) {
            var first_digit_front = findFirstDigitFromFront(stripped_line);
            var first_digit_back = findFirstDigitFromBack(stripped_line);

            if (first_digit_front!= -1 && first_digit_back!= -1) {
                total_sum += first_digit_front + first_digit_back;
            } else {
                std.debug.warn("Warning: Skipping line {}, no digits found.\n",.{line.len});
            }

            std.debug.print("Front={}, Back={}\n",.{first_digit_front},.{first_digit_back});
        }
    }

    file.close();
    std.debug.print("Total Sum: {}\n",.{total_sum});
}

