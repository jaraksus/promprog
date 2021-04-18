load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

cc_binary(
	name = "Builder",
	srcs = [
		"Chef.cpp",
		"Chef.h",
        "builders/BurgerBuilder.cpp",
        "builders/BurgerBuilder.h",
        "builders/HamburgerBuilder.cpp",
        "builders/HamburgerBuilder.h",
        "builders/base/Burger.cpp",
        "builders/base/Burger.h",
        "builders/VegiburgerBuilder.cpp",
        "builders/VegiburgerBuilder.h",
        "main.cpp"
    ],
	visibility = ["//visibility:public"],
)

cc_library(
    name = "burger_shop",
    srcs = [
    	"Chef.cpp",
        "builders/BurgerBuilder.cpp",
        "builders/HamburgerBuilder.cpp",
        "builders/base/Burger.cpp",
        "builders/VegiburgerBuilder.cpp"
    ],
    hdrs = [
    	"builders/base/Burger.h",
    	"builders/BurgerBuilder.h",
    	"builders/HamburgerBuilder.h",
    	"builders/VegiburgerBuilder.h",
    	"Chef.h"
    ],
    visibility = ["//visibility:public"],
    linkstatic=False
)