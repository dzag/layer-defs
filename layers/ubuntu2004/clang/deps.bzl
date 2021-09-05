load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

CLANG_INSTALLER = struct(
    revision = "88c9162c9d47ef43a505bc5301dc626f3cd4f437",
    sha256 = "729134bdde35efa69e2a0043671428effe73ac2d65bb0c26f1ea564520d41f44",
)

LIBCXX_INSTALLER = struct(
    revision = "88c9162c9d47ef43a505bc5301dc626f3cd4f437",
    sha256 = "eaa056ccc78b891245d69411dd713bd3d57b7020a27039c139d7462a648fda05",
)

CLANG_DEPS = struct(
    revision = "2004.5.0",
    sha256 = "d9edb7ca89975e0459c407b537ea5bcfd8165b9a3759d6d09e5f4864b98922e7"
)

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    # Clang
    if "ubuntu2004_clang_debs" not in excludes:
        http_file(
            name = "ubuntu2004_clang_debs",
            downloaded_file_path = "clang_debs.tar.gz",
            sha256 = CLANG_DEPS.sha256,
            urls = [
                "https://github.com/dzag/layer-artifacts/releases/download/" + CLANG_DEPS.revision + "/clang_debs.tar",
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
