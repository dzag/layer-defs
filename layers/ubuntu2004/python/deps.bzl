load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

PYTHON_DEPS = struct(
    revision = "2004.4.0",
    sha256 = "17c17d31581f6572806ff84998efc53a066f49016a8e3e148e0f761cbfedac5c"
)

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004_python_debs" not in excludes:
        http_file(
            name = "ubuntu2004_python_debs",
            downloaded_file_path = "python_debs.tar",
            sha256 = PYTHON_DEPS.sha256,
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/" + PYTHON_DEPS.revision + "/python_debs.tar",
            ],
        )
