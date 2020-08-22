load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004_python_debs" not in excludes:
        http_file(
            name = "ubuntu2004_python_debs",
            downloaded_file_path = "python_debs.tar",
            sha256 = "4213384917ab3cb9213c3780f03a7f4b3b01ca878f4d897c3f01aca2a95746b4",
            urls = [
                "https://github.com/dzag/layer_artifacts/releases/download/2004/python_debs.tar",
            ],
        )
