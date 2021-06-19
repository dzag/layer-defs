load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

DOCKER_DEPS = struct(
    revision = "2004.4.0",
    sha256 = "35f90f2a4be9f9ee37b23fcf4215e588ebde74d9ebc5ef75f1ae9966631de112"
)

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004_docker_debs" not in excludes:
        http_file(
            name = "ubuntu2004_docker_debs",
            downloaded_file_path = "docker_debs.tar",
            sha256 = DOCKER_DEPS.sha256,
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/" + DOCKER_DEPS.revision +  "/docker_debs.tar",
            ],
        )
