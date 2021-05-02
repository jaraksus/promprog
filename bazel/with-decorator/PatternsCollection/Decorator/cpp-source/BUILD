load("@rules_cc//cc:defs.bzl", "cc_binary")
load("@rules_foreign_cc//foreign_cc:cmake.bzl", "cmake")

cmake(
    name='tgbot',
    lib_source='@tgbot//:all',
    out_shared_libs=["libTgBot.so.1"],
    out_include_dir="include",
    generate_args=["-DBUILD_SHARED_LIBS=ON"]
)

cmake(
    name='inicpp',
    lib_source='@inicpp//:all',
    out_shared_libs=["libinicpp.so"],
    out_include_dir="include",
    generate_args=["-DINICPP_BUILD_SHARED=ON"]
)

cmake(
    name='vmime',
    lib_source='@vmime//:all',
    out_shared_libs=["libvmime.so.1"],
    out_include_dir="include",
    generate_args=["-DVMIME_HAVE_SASL_SUPPORT=OFF", "-DVMIME_BUILD_SHARED_LIBRARY=ON", "-DVMIME_BUILD_STATIC_LIBRARY=OFF"]
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