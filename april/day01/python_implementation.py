#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon May 27 09:49:13 2024

@author: stephenson
"""

import re
from pathlib import Path

def find_first_digit_from_front(line):
    """Find the first digit in the line when iterating from front to back."""
    match = re.search(r'\d', line)
    return int(match.group()) if match else None

def find_first_digit_from_back(line):
    """Find the first digit in the line when iterating from back to front."""
    reversed_line = line[::-1]
    match = re.search(r'\d', reversed_line)
    return int(match.group()) if match else None

def main():
    # Specify the path to the input file
    file_path = "puzzleinput.txt"
    
    # Check if the file exists
    if not Path(file_path).is_file():
        print(f"Error: File '{file_path}' does not exist.")
        return
    
    # Initialize the total sum
    total_sum = 0
    
    # Debugging output
    print("Starting file processing...")
    
    # Open the file
    try:
        with open(file_path, 'r', encoding='utf-8') as file:  # Explicitly specify UTF-8 encoding
            # Iterate over each line in the file
            for line in file:
                print(f"Processing line: {line.strip()}")  # Debugging output
                first_digit_front = find_first_digit_from_front(line)
                first_digit_back = find_first_digit_from_back(line)
                
                if first_digit_front is not None and first_digit_back is not None:
                    total_sum += first_digit_front + first_digit_back
                
                print(f"Front={first_digit_front}, Back={first_digit_back}")
    except Exception as e:
        print(f"An error occurred: {e}")
    
    # Log the total sum
    print(f"Total Sum: {total_sum}")

if __name__ == "__main__":
    main()
