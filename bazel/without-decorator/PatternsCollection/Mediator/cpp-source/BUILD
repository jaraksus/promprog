load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
	name = "Mediator",
	srcs = [
		"main.cpp", "dispatcher/Dispatcher.cpp", "dispatcher/Dispatcher.h",
		"vehicles/Vehicle.cpp", "vehicles/Vehicle.h", "vehicles/Plane.cpp",
		"vehicles/Plane.h", "vehicles/PlaneCommands.h", 
		"dispatcher/PlaneDispatcher.cpp", "dispatcher/PlaneDispatcher.h"
	],
	linkopts = ["-lpthread"],
	visibility = ["//visibility:public"],
)