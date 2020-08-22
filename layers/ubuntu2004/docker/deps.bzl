load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004_docker_debs" not in excludes:
        http_file(
            name = "ubuntu2004_docker_debs",
            downloaded_file_path = "docker_debs.tar",
            sha256 = "cb312ed18899cb5ef34560de3926d13df9b2ef5eb8d8b0bd3145f599a39e8593",
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/2004/docker_debs.tar",
            ],
        )
