load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
	name = "Command",
	srcs = [
		"main.cpp", "commands/Command.cpp", "commands/Command.h", "commands/CreateSoupCommand.cpp", 
		"commands/CreateSoupCommand.h", "Waiter.cpp", "Waiter.h", "cookery/Cook.cpp", "cookery/Cook.h", "cookery/CookPool.cpp",
		"cookery/CookPool.h", "Dish.h", "cookery/Barman.cpp", "cookery/Barman.h", 
		"commands/CreateCocktailCommand.cpp", "commands/CreateCocktailCommand.h"
	],
	linkopts = ["-lpthread"],
	visibility = ["//visibility:public"],
)