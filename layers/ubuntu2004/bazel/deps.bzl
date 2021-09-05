load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

BAZEL_INSTALLER = struct(
    revision = "5.0.0-pre.20210826.1",
    sha256 = "9b916996c58af77180f657d8f55c61f6cfa9868bfa87b5ed2d4c9467a6ddb3d0",
)

BAZEL_DEPS = struct(
    revision = "2004.5.0",
    sha256 = "9a6eab8fb239d9e9428abd07f7b3d77644cfd26ced6c9e468b0bebc4de24d083",
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
