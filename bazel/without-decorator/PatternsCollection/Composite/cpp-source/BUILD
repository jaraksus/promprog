load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
	name = "Composite",
	srcs = [
		"main.cpp",
		"ration/DishComponent.cpp",
		"ration/Dish.cpp",
		"ration/Milk.cpp", 
		"ration/Breakfast.cpp"
	] + glob([
		"include/*.h"
	]),
	includes = [
		"include"
	],
	visibility = ["//visibility:public"],
)