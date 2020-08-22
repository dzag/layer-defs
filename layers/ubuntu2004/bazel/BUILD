load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@io_bazel_rules_docker//docker/package_managers:download_pkgs.bzl", "download_pkgs")
load(
    "@io_bazel_rules_docker//docker/toolchain_container:toolchain_container.bzl",
    "language_tool_layer",
    "toolchain_container",
)
load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_extract")

package(default_visibility = ["//visibility:public"])

bzl_library(
    name = "lib",
    srcs = glob(["*.bzl"]),
)

download_pkgs(
    name = "bazel_debs",
    image_tar = "@ubuntu2004//image",
    packages = [
        "bash-completion",
        "binutils",
        "file",
        "git",
        "make",
        "openssh-client",
        "patch",
        "unzip",
        "wget",
        "xz-utils",
        "zip",
    ],
)

toolchain_container(
    name = "bazel_installer_image",
    base = "@ubuntu2004//image",
    files = [
        ":bazel.bazelrc",
        "@ubuntu2004_bazel_installer//file",
    ],
    packages = [
        "unzip",
    ],
)

container_run_and_extract(
    name = "bazel_tar",
    commands = [
        "mv /bazel.bazelrc /etc/bazel.bazelrc",
        "chmod +x /bazel-installer.sh",
        "/bazel-installer.sh",
        "tar cvf /bazel.tar --mtime='1970-01-01' /usr/local/lib/bazel/* /etc/bazel.bazelrc",
    ],
    extract_file = "/bazel.tar",
    image = ":bazel_installer_image.tar",
)

language_tool_layer(
    name = "bazel-ltl",
    base = "@ubuntu2004//image",
    installables_tar = "@ubuntu2004_bazel_debs//file",
    symlinks = {
        "/usr/local/bin/bazel": "/usr/local/lib/bazel/bin/bazel",
    },
    tars = [":bazel_tar/bazel.tar"],
)