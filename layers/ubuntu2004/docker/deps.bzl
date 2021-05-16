load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004_docker_debs" not in excludes:
        http_file(
            name = "ubuntu2004_docker_debs",
            downloaded_file_path = "docker_debs.tar",
            sha256 = "7c1f655ec1364221f634cdb35096a506594c454bd406d0736b2972e75ec624f6",
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/2004.3.0/docker_debs.tar",
            ],
        )
