# Simple Makefile with conditional statements

# Check which OS we're on
ifeq ($(shell uname),Darwin)
    OS = Mac
    PYTHON = python3
else ifeq ($(shell uname),Linux)
    OS = Linux
    PYTHON = python3
else
    OS = Windows
    PYTHON = python
endif

# Allow setting the mode (default is "normal")
MODE ?= normal

# Run the program
run:
	@echo "Running on $(OS) in $(MODE) mode"
	$(PYTHON) main.py $(ARGS)

# Conditional target that only exists on Unix-like systems
ifeq ($(OS),Mac)
mac-only:
	@echo "This command only runs on Mac"
endif

# Conditional command execution
test:
	@echo "Testing..."
ifeq ($(MODE),verbose)
	@echo "Running in verbose mode"
	$(PYTHON) main.py --verbose
else
	@echo "Running in normal mode"
	$(PYTHON) main.py
endif

# Target with conditional parts
clean:
	rm -f *.pyc
	rm -rf __pycache__
ifeq ($(MODE),deep-clean)
	@echo "Performing deep clean..."
	rm -rf .venv
endif

# Help shows different options based on OS
help:
	@echo "Available commands:"
	@echo "  make run              - Run the program"
	@echo "  make run ARGS=\"hello\" - Run with arguments"
	@echo "  make test             - Run tests"
	@echo "  make test MODE=verbose - Run tests verbosely"
	@echo "  make clean            - Clean up files"
	@echo "  make clean MODE=deep-clean - Deep clean"
ifeq ($(OS),Mac)
	@echo "  make mac-only         - Mac-only command"
endif
