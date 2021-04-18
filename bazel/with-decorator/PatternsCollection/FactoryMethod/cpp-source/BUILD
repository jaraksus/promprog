load("@rules_cc//cc:defs.bzl", "cc_binary")

cc_binary(
	name = "FactoryMethod",
	srcs = ["main.cpp", "routes/Route.cpp", "routes/EthernetRoute.cpp", "routes/WifiRoute.cpp", 
			"routers/Router.cpp", "routers/Hub.cpp", "routers/WifiRouter.cpp", 
			"routes/Route.h", "routes/EthernetRoute.h", "routes/WifiRoute.h", 
			"routers/Router.h", "routers/Hub.h", "routers/WifiRouter.h"],
	copts = ["-I FactoryMethod/cpp-source"],
	visibility = ["//visibility:public"],
)