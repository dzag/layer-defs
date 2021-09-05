load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

PYTHON_DEPS = struct(
    revision = "2004.5.0",
    sha256 = "331cb723f3d581a7c9854cb79ab05e895695e9a8278ee0169d50d25e47b99abc"
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
