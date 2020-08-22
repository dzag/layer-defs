load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
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
    name = "python_debs",
    image_tar = "@ubuntu2004//image",
    packages = [
        "python3.8",
        "python3-dev",
        "python3-pip",
        "python-is-python3",
        "python-setuptools",
        "software-properties-common",
    ],
)

PYTHON_CLEANUP_COMMANDS = (
    "find /usr/lib/python* -name __pycache__ -exec rm -rf {} +"
)

language_tool_layer(
    name = "python-ltl",
    base = "@ubuntu2004//image",
    installables_tar = "@ubuntu2004_python_debs//file",
    installation_cleanup_commands = PYTHON_CLEANUP_COMMANDS,
)