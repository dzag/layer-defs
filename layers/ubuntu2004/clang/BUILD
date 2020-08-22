load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load("@io_bazel_rules_docker//docker/package_managers:download_pkgs.bzl", "download_pkgs")
load(
    "@io_bazel_rules_docker//docker/toolchain_container:toolchain_container.bzl",
    "language_tool_layer",
)

package(default_visibility = ["//visibility:public"])

bzl_library(
    name = "lib",
    srcs = glob(["*.bzl"]),
)

download_pkgs(
    name = "clang_debs",
    image_tar = "@ubuntu2004//image",
    packages = [
        "g++",
        "libstdc++-7-dev",
    ],
)

pkg_tar(
    name = "clang_tar",
    package_dir = "/usr/local",
    strip_prefix = ".",
    tags = ["manual"],
    deps = [
        "@ubuntu2004_clang_release//file",
    ],
)

pkg_tar(
    name = "libcxx_tar",
    package_dir = "/usr/local",
    strip_prefix = ".",
    tags = ["manual"],
    deps = [
        "@ubuntu2004_libcxx_release//file",
    ],
)

language_tool_layer(
    name = "clang-ltl",
    base = "@ubuntu2004//image",
    env = {
        "ASAN_SYMBOLIZER_PATH": "/usr/local/bin/llvm-symbolizer",
        "CC": "/usr/local/bin/clang",
        "GCOV": "/dev/null",
        "LD_LIBRARY_PATH": "/usr/local/lib",
        "MSAN_SYMBOLIZER_PATH": "/usr/local/bin/llvm-symbolizer",
        "TSAN_SYMBOLIZER_PATH": "/usr/local/bin/llvm-symbolizer",
        "UBSAN_SYMBOLIZER_PATH": "/usr/local/bin/llvm-symbolizer",
    },
    installables_tar = "@ubuntu2004_clang_debs//file",
    tars = [
        ":clang_tar",
        ":libcxx_tar",
    ],
)
