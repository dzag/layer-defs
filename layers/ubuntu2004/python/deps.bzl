load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004_python_debs" not in excludes:
        http_file(
            name = "ubuntu2004_python_debs",
            downloaded_file_path = "python_debs.tar",
            sha256 = "bcb6a0265d47bc74c5135d6cb3ef5cc599a827dee7140dabf9906585d3ecbba5",
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/2004.3.0/python_debs.tar",
            ],
        )
