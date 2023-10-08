load("@rules_flex//flex:flex.bzl", "flex_cc_library")

flex_cc_library(
    name = "lexer",
    src = "lexer.lpp",
    strip_include_prefix = "include",
    deps = ["//headers:headers", "//src/parsing:parser", "//src/parsing:parser_header"],
    visibility = ["//visibility:public"],
)


cc_binary(
    name = "lexer_bin",
    deps = [":lexer"],
)

cc_library(
    name = "parser_header",
    hdrs = ["parser.hpp"],
    textual_hdrs = ["//src/parsing:lexer"],
)

load("@rules_bison//bison:bison.bzl", "bison_cc_library")

bison_cc_library(
    name = "parser",
    src = "parser.ypp",
)