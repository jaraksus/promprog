load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")

cc_library(
    name = "isaac_rooms",
    srcs = [
    	"rooms/BasementHardRoom.cpp",
        "rooms/BasementNormalRoom.cpp",
        "rooms/CavesHardRoom.cpp",
        "rooms/CavesNormalRoom.cpp",
        "rooms/HardRoom.cpp",
        "rooms/NormalRoom.cpp",
        "rooms/Room.cpp"
    ],
    hdrs = [
    	"rooms/CavesHardRoom.h", "rooms/CavesNormalRoom.h",
		"rooms/BasementHardRoom.h", "rooms/BasementNormalRoom.h", "rooms/HardRoom.h", "rooms/NormalRoom.h", "rooms/Room.h"
    ],
    visibility = ["//visibility:public"],
    linkstatic=False
)

cc_library(
    name = "isaac_factories",
    srcs = [
    	"factories/BasementFactory.cpp", 
        "factories/CavesFactory.cpp", 
        "factories/RoomFactory.cpp"
    ],
    hdrs = [
    	"factories/BasementFactory.h", "factories/CavesFactory.h", "factories/RoomFactory.h"
    ],
    deps = [
        ":isaac_rooms"
    ],
    visibility = ["//visibility:public"],
    linkstatic=False
)

cc_library(
    name = "serializers",
    srcs = [
        "rooms/HardRoom.cpp",
        "rooms/HardRoom.h",
        "rooms/NormalRoom.cpp",
        "rooms/NormalRoom.h",
        "rooms/Room.cpp", 
        "rooms/Room.h",
        "serializers/RoomSerializer.cpp",
        "serializers/GameSerializer.cpp",
    ],
    hdrs = [
        "serializers/GameSerializer.h",
        "serializers/RoomSerializer.h",
    ],
    copts = [
    	"-IAbstractFactory/cpp-source/rooms", 
    	"-IAbstractFactory/cpp-source/serializers"
    ],
    visibility = ["//visibility:public"],
    linkstatic=False
)

cc_binary(
	name = "AbstractFactorySerializer",
	srcs = ["main_serializer.cpp"],
	deps = [":isaac_rooms", ":isaac_factories", ":serializers"],
	copts = [
    	"-IAbstractFactory/cpp-source/rooms", 
    	"-IAbstractFactory/cpp-source/serializers",
    	"-IAbstractFactory/cpp-source/factories"
    ],
	visibility = ["//visibility:public"],
)