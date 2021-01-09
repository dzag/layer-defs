load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004_docker_debs" not in excludes:
        http_file(
            name = "ubuntu2004_docker_debs",
            downloaded_file_path = "docker_debs.tar",
            sha256 = "619702cdf0238bfdf9bd6e1e5b8167160b151d5656e7ac31e38659aa9ca418e7",
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/2004.2.0/docker_debs.tar",
            ],
        )
