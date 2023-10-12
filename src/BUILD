load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
    name = "main",
    srcs = ["main.cpp", "symbolTable.cpp"],
    deps = ["//headers:headers", "//src/parsing:parser", "//src/debug:debug"],
)