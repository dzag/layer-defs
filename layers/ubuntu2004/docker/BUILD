load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@io_bazel_rules_docker//docker/package_managers:apt_key.bzl", "add_apt_key")
load("@io_bazel_rules_docker//docker/package_managers:download_pkgs.bzl", "download_pkgs")
load(
    "@io_bazel_rules_docker//docker/toolchain_container:toolchain_container.bzl",
    "language_tool_layer",
    "toolchain_container",
)

package(default_visibility = ["//visibility:public"])

bzl_library(
    name = "lib",
    srcs = glob(["*.bzl"]),
)

toolchain_container(
    name = "docker-prereq",
    base = "@ubuntu2004//image",
    packages = [
        "apt-transport-https",
        "ca-certificates",
        "curl",
    ],
)

add_apt_key(
    name = "docker-key-image",
    image = ":docker-prereq.tar",
    keys = [
        "@docker_gpg//file",
    ],
)

download_pkgs(
    name = "docker_debs",
    additional_repos = [
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable",
    ],
    image_tar = ":docker-key-image.tar",
    packages = [
        "docker-ce",
    ],
)

language_tool_layer(
    name = "docker-ltl",
    base = "@ubuntu2004//image",
    installables_tar = "@ubuntu2004_docker_debs//file",
)
