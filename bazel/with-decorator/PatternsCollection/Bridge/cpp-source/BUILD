load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
	name = "Bridge",
	srcs = [
		"main.cpp",
		"wheels/SteeringWheel.cpp",
    	"axles/Axle.cpp",
    	"wheels/Gamepad.cpp",
    	"axles/CarAxle.cpp",
    	"wheels/PlaneWheel.cpp",
    	"axles/PlaneAxle.cpp"
	] + glob([
		"include/*.h"
	]),
	includes = [
		"include"
	],
	visibility = ["//visibility:public"],
)