PARSING_TOOLS_DIR := ./src/parsing/
LEXER_FILE_NAME := lexer.l
BISON_FILE_NAME := parser.ypp
BISON_FLAGS := -d -o parser.cpp
LEXER_FLAGS := -o lexer.cpp

.PHONY: build_bazel
build_bazel: build_parsing_tools
	bazel build //src:main

.PHONY: build_parsing_tools FORCE
build_parsing_tools:
	cd $(PARSING_TOOLS_DIR) && flex $(LEXER_FLAGS) $(LEXER_FILE_NAME) && bison $(BISON_FLAGS) $(BISON_FILE_NAME)

.PHONY: FORCE

.PHONY: clean_parser
clean_parser:
	cd $(PARSING_TOOLS_DIR) && rm parser.cpp parser.hpp lexer.cpp

.PHONY: clean
clean:
	bazel clean