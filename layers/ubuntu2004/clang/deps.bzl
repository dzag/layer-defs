load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

CLANG_INSTALLER = struct(
    revision = "92cb0ce8f814cd39ef4598fe074534cb787a9e78",
    sha256 = "fede4fa15b1350d642a0af3a7c7a116262f70d66710160765c6af73927218ddd",
)

LIBCXX_INSTALLER = struct(
    revision = "92cb0ce8f814cd39ef4598fe074534cb787a9e78",
    sha
)

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    # Clang
    if "ubuntu2004_clang_debs" not in excludes:
        http_file(
            name = "ubuntu2004_clang_debs",
            downloaded_file_path = "clang_debs.tar.gz",
            sha256 = "e77639985fe60c55dbef532de3dd89a876c91bffabefae18081b023def412835",
            urls = [
                "https://github.com/dzag/layer_artifacts/releases/download/2004/clang_debs.tar",
            ],
        )

    if "ubuntu2004_clang_release" not in excludes:
        http_file(
            name = "ubuntu2004_clang_release",
            downloaded_file_path = "clang_r" + CLANG_INSTALLER.revision + ".tar.gz",
            sha256 = CLANG_INSTALLER.sha256,
            urls = ["https://storage.googleapis.com/clang-builds-stable/clang-ubuntu18_04/clang_r" + CLANG_INSTALLER.revision + ".tar.gz"],
        )

    # libcxx
    if "ubuntu2004_libcxx_release" not in excludes:
        http_file(
            name = "ubuntu2004_libcxx_release",
            downloaded_file_path = "libcxx-msan_r" + LIBCXX_INSTALLER.revision + ".tar.gz",
            sha256 = LIBCXX_INSTALLER.sha256,
            urls = ["https://storage.googleapis.com/clang-builds-stable/clang-ubuntu18_04/libcxx-msan_r" + LIBCXX_INSTALLER.revision + ".tar.gz"],
        )
