load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

BAZEL_INSTALLER = struct(
    revision = "3.7.2",
    sha256 = "8416ff3900075ed588869a5b6dcc97844f56834e5a8344a2e27ec34a1eaf847e",
)

BAZEL_DEPS = struct(
    revision = "2004.2.0",
    sha256 = "2f9a5f754f93d7f974c36bc3eed9fd4351a19898881f31241d4b6b447f489c4e",
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
