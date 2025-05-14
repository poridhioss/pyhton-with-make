#!/usr/bin/env python3
"""
Simple Python program example.
"""
import sys

def main():
    # Print arguments if provided, or a simple message
    if len(sys.argv) > 1:
        print(f"You said: {' '.join(sys.argv[1:])}")
    else:
        print("Hello, World!")

if __name__ == "__main__":
    main()
