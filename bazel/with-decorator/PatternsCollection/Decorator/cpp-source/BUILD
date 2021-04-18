load("@rules_cc//cc:defs.bzl", "cc_binary")
load("@rules_foreign_cc//foreign_cc:cmake.bzl", "cmake")

cmake(
    name='tgbot',
    lib_source='@tgbot//:all',
    out_static_libs=["libTgBot.a"],
    out_include_dir="include",
)

cmake(
    name='inicpp',
    lib_source='@inicpp//:all',
    out_static_libs=["libinicpp.a"],
    out_include_dir="include",
)

cmake(
    name='vmime',
    lib_source='@vmime//:all',
    out_static_libs=["libvmime.a"],
    out_include_dir="include",
    generate_args=["-DVMIME_HAVE_SASL_SUPPORT=OFF"]
)

cc_binary(
	name = "Decorator",
	srcs = [
		"main.cpp",
    	"notifiers/Notifier.cpp",
    	"notifiers/LogNotifier.cpp",
    	"notifiers/DecoratorNotifier.cpp",
    	"notifiers/TgNotifier.cpp",
    	"notifiers/EmailNotifier.cpp"
	] + glob([
		"include/*.h"
	]),
	deps = [
		":tgbot",
		":inicpp",
		":vmime",
		"@boost//:system",
		"@boost//:asio_ssl",
		"@boost//:asio"
	],
	includes = [
		"include"
	],
	linkopts = ["-lpthread"],
	visibility = ["//visibility:public"],
)