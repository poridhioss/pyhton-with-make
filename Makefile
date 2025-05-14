# Simple Makefile for Python

# Run the program
run:
	python3 main.py

# Run with arguments
args:
	python3 main.py $(ARGS)

# Clean up
clean:
	rm -f *.pyc
	rm -rf __pycache__
