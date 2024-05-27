#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h> // Include this to declare strlen and strcspn

int find_first_digit_from_front(const char *line) {
    for (int i = 0; line[i]!= '\0'; ++i) {
        if (isdigit((unsigned char)line[i])) {
            return line[i] - '0';
        }
    }
    return -1; // Return -1 if no digit is found
}

int find_first_digit_from_back(const char *line) {
    int length = strlen(line);
    for (int i = length - 1; i >= 0; --i) {
        if (isdigit((unsigned char)line[i])) {
            return line[i] - '0';
        }
    }
    return -1; // Return -1 if no digit is found
}

#define MAX_LINE_LENGTH 1024 // Assuming a maximum line length of 1024 characters

int main(void) {
    FILE *file = fopen("puzzleinput.txt", "r");
    if (file == NULL) {
        printf("Error: File 'puzzleinput.txt' does not exist.\n");
        return 1;
    }

    int total_sum = 0;

    printf("Starting file processing...\n");

    char line[MAX_LINE_LENGTH];
    while (fgets(line, sizeof(line), file)) {
        // Strip newline character
        line[strcspn(line, "\n")] = '\0';

        int first_digit_front = find_first_digit_from_front(line);
        int first_digit_back = find_first_digit_from_back(line);

        if (first_digit_front!= -1 && first_digit_back!= -1) {
            total_sum += first_digit_front + first_digit_back;
        } else {
            printf("Warning: Skipping line, no digits found.\n");
        }

        printf("Front=%d, Back=%d\n", first_digit_front, first_digit_back);
    }

    fclose(file);

    printf("Total Sum: %d\n", total_sum);

    return 0;
}

