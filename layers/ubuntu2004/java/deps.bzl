load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

OPENJDK_INSTALLER = struct(
    revision = "11.29.3-ca-jdk11.0.2/zulu11.29.3-ca-jdk11.0.2-linux_x64-allmodules-90755145cb6e6418584d8603cd5fa9afbb30aecc-1549209950",
    sha256 = "460d8a4f0c0204160b48086e341b22943c9cca471b195340e75b38ae9eb33c1c",
)

def deps():
    """ ok """
    excludes = native.existing_rules().keys()

    if "ubuntu2004_java_debs" not in excludes:
        http_file(
            name = "ubuntu2004_java_debs",
            downloaded_file_path = "java_debs.tar",
            sha256 = "b5bb6c0d46426b3fa21bb46eeb2f0cad6cee3b8633888dae7bba62ca9cdab30b",
            urls = [
                "https://github.com/dzag/layer_artifacts/releases/download/2004/java_debs.tar",
            ],
        )

    if "ubuntu2004_java_cacerts" not in excludes:
        http_file(
            name = "ubuntu2004_java_cacerts",
            downloaded_file_path = "cacerts.tar",
            sha256 = "fd3da6ed8e6cbe7d217f820b29e75d9ed21fbe5f091c71f84eab420264ecab63",
            urls = [
                "https://github.com/dzag/layer_artifacts/releases/download/2004/cacerts.tar",
            ],
        )
