load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
	name = "Adapter",
	srcs = glob([
		"*.cpp",
		"*.h"
	]),
	deps = [
        "@boost//:algorithm",
    ],
	visibility = ["//visibility:public"],
)