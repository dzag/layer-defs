load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")
load(":revisions.bzl", "BAZEL_INSTALLER")

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
            sha256 = "642685bcb6704ea2aaaaffb73f2885cc5bd0ca56b0c10b2ebd3808a4057c0f95",
            urls = [
                "https://github.com/dzag/layer_artifacts/releases/download/2004/bazel_debs.tar",
            ],
        )