.PHONY: format format-check
format:
	clang-format -i src/*.c

format-check:
	clang-format --dry-run --Werror src/*.c
