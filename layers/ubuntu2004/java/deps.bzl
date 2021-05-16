load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def deps():
    """ ok """
    excludes = native.existing_rules().keys()

    if "ubuntu2004_java_debs" not in excludes:
        http_file(
            name = "ubuntu2004_java_debs",
            downloaded_file_path = "java_debs.tar",
            sha256 = "343a084d574b6933513be602a8234c9e198ca32698bb2dff020c12acb5aa5fe6",
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/2004.3.0/java_debs.tar",
            ],
        )

    if "ubuntu2004_java_cacerts" not in excludes:
        http_file(
            name = "ubuntu2004_java_cacerts",
            downloaded_file_path = "cacerts.tar",
            sha256 = "2518837dbc04225a1b0594097b3fd0eb6b250e95f64048445129ab6beda9168d",
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/2004.3.0/cacerts.tar",
            ],
        )
