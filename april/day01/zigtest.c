#include <stdio.h>
#include <stdlib.h>

int main() {
    const char *url = "https://adventofcode.com/2023/day/1/input";
    
    // Build the curl command
    char command[512];
    snprintf(command, sizeof(command), "curl -s \"%s\"", url);
    
    // Open a pipe to execute the curl command
    FILE *curl_output = popen(command, "r");
    if (!curl_output) {
        fprintf(stderr, "Failed to execute curl command\n");
        return 1;
    }
    
    // Read and print the output of the curl command
    char buffer[4096];
    while (fgets(buffer, sizeof(buffer), curl_output) != NULL) {
        printf("%s", buffer);
    }
    
    // Close the pipe
    pclose(curl_output);
    
    return 0;
}

