load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

JAVA_DEPS = struct(
    revision = "2004.5.0",
    java_sha256 = "169876d231e7fdc8775e9ed2df850a26cd96edb7297b8f9eb1f51d9a864d7ba6",
    cacerts_sha256 = "3e1322466722719eb5ce3c64bb1b8e0ff975e6a100b65926b715220d5e7de34a"
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
