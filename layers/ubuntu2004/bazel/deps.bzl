load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

BAZEL_INSTALLER = struct(
    revision = "3.6.0",
    sha256 = "74818248b8c643da013f3e76c9fdc81c37dd4aceedcc7c55d2ba52ff6044379c",
)

BAZEL_DEPS = struct(
    revision = "2004.1.0",
    sha256 = "02b6f5671573745c20eb433bf9860715f904ff6204e4a142ffab185d497827d0",
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
