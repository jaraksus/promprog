load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
	name = "Facade",
	srcs = [
        "main.cpp"
	] + glob([
		"facades/*.h",
		"facades/*.cpp"
	]),
	deps = [
		"//AbstractFactory/cpp-source:isaac_rooms", 
		"//AbstractFactory/cpp-source:isaac_factories", 
		"//AbstractFactory/cpp-source:serializers",
		"//Builder/cpp-source:burger_shop"
	],
	copts = [
    	"-IAbstractFactory/cpp-source/rooms", 
    	"-IAbstractFactory/cpp-source/serializers",
    	"-IAbstractFactory/cpp-source/factories"
    ],
	visibility = ["//visibility:public"],
)