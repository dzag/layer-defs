workspace(name = "layer_defs")

load(
    "@bazel_tools//tools/build_defs/repo:http.bzl",
    "http_archive",
)

load(":revisions.bzl", "RULES_DOCKER", "BAZEL_TOOLCHAINS")

http_archive(
    name = "io_bazel_rules_docker",
    sha256 = RULES_DOCKER.sha256,
    strip_prefix = "rules_docker-" + RULES_DOCKER.version,
    urls = ["https://github.com/bazelbuild/rules_docker/releases/download/" + RULES_DOCKER.version + "rules_docker-v" + RULES_DOCKER.version + ".tar.gz"],
)

http_archive(
    name = "bazel_toolchains",
    sha256 = BAZEL_TOOLCHAINS.sha256,
    strip_prefix = "bazel-toolchains-" + BAZEL_TOOLCHAINS.version,
    urls = [
        "https://github.com/bazelbuild/bazel-toolchains/releases/download/" + BAZEL_TOOLCHAINS.version + "/bazel-toolchains-" + BAZEL_TOOLCHAINS.version + ".tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/archive/" + BAZEL_TOOLCHAINS.version + ".tar.gz",
    ],
)

http_archive(
    name = "bazel_skylib",
    sha256 = "e5d90f0ec952883d56747b7604e2a15ee36e288bb556c3d0ed33e818a4d971f2",
    strip_prefix = "bazel-skylib-1.0.2",
    urls = ["https://github.com/bazelbuild/bazel-skylib/archive/1.0.2.tar.gz"],
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load("@io_bazel_rules_docker//repositories:deps.bzl", container_deps = "deps")

container_deps()

load("@io_bazel_rules_docker//repositories:pip_repositories.bzl", "pip_deps")

pip_deps()

# UBUNTU 20.04

load("//layers/ubuntu2004/base:deps.bzl", ubuntu2004_base_deps = "deps")

ubuntu2004_base_deps()

load("//layers/ubuntu2004/bazel:deps.bzl", ubuntu2004_bazel_deps = "deps")

ubuntu2004_bazel_deps()

load("//layers/ubuntu2004/java:deps.bzl", ubuntu2004_java_deps = "deps")

ubuntu2004_java_deps()

load("//layers/ubuntu2004/python:deps.bzl", ubuntu2004_python_deps = "deps")

ubuntu2004_python_deps()

load("//layers/ubuntu2004/clang:deps.bzl", ubuntu2004_clang_deps = "deps")

ubuntu2004_clang_deps()
