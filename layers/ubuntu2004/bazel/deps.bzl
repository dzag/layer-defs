load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

BAZEL_INSTALLER = struct(
    revision = "4.1.0",
    sha256 = "e3f08054165be0a5e90779654b0e5c68d262ae794407d6347cdc6e8d05fafaaf",
)

BAZEL_DEPS = struct(
    revision = "2004.4.0",
    sha256 = "18a44c17044490ed1b684f16cd4784f682b9a98cbb5770fab730a884d6490fbd",
)

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    # The official Bazel installer.sh.
    if "ubuntu2004_bazel_installer" not in excludes:
        http_file(
            name = "ubuntu2004_bazel_installer",
            downloaded_file_path = "bazel-installer.sh",
            sha256 = BAZEL_INSTALLER.sha256,
            urls = [
                "https://releases.bazel.build/" + BAZEL_INSTALLER.revision + "/release/bazel-" + BAZEL_INSTALLER.revision + "-installer-linux-x86_64.sh",
                "https://github.com/bazelbuild/bazel/releases/download/" + BAZEL_INSTALLER.revision + "/bazel-" + BAZEL_INSTALLER.revision + "-installer-linux-x86_64.sh",
            ],
        )

    if "ubuntu2004_bazel_debs" not in excludes:
        http_file(
            name = "ubuntu2004_bazel_debs",
            downloaded_file_path = "bazel_debs.tar",
            sha256 = BAZEL_DEPS.sha256,
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/" + BAZEL_DEPS.revision +"/bazel_debs.tar",
            ],
        )
