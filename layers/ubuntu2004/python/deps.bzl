load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004_python_debs" not in excludes:
        http_file(
            name = "ubuntu2004_python_debs",
            downloaded_file_path = "python_debs.tar",
            sha256 = "87cf12786c11c209877f952bf09d0ca86776ada120e9fa3cca11bd4c469dd66f",
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/2004.2.0/python_debs.tar",
            ],
        )
