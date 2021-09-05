load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

DOCKER_DEPS = struct(
    revision = "2004.5.0",
    sha256 = "4ee243c42285bff7ffefb50e01ad109d5394283924f5636d979ac82485601722"
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
