load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
	name = "Observer",
	srcs = glob(["*.cpp", "*.h"]),
	linkopts = ["-lpthread"],
	visibility = ["//visibility:public"],
)