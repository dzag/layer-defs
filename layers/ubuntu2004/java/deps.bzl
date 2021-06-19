load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

JAVA_DEPS = struct(
    revision = "2004.4.0",
    java_sha256 = "e23e0bc4cc2016275112fd7d1b8b3e088ea25e37578601d78f05d12ffa5e184a",
    cacerts_sha256 = "6432a4aeef57f6f3b115fe57dbaac90600a56672c359ab8dd654b5d3417a5a15"
)

def deps():
    """ ok """
    excludes = native.existing_rules().keys()

    if "ubuntu2004_java_debs" not in excludes:
        http_file(
            name = "ubuntu2004_java_debs",
            downloaded_file_path = "java_debs.tar",
            sha256 = JAVA_DEPS.java_sha256,
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/" + JAVA_DEPS.revision + "/java_debs.tar",
            ],
        )

    if "ubuntu2004_java_cacerts" not in excludes:
        http_file(
            name = "ubuntu2004_java_cacerts",
            downloaded_file_path = "cacerts.tar",
            sha256 = JAVA_DEPS.cacerts_sha256,
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/" + JAVA_DEPS.revision + "/cacerts.tar",
            ],
        )
