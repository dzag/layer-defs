load("@bazel_skylib//:bzl_library.bzl", "bzl_library")
load("@io_bazel_rules_docker//contrib/automatic_container_release:packages_metadata.bzl", "packages_metadata")
load("@io_bazel_rules_docker//docker/package_managers:download_pkgs.bzl", "download_pkgs")
load(
    "@io_bazel_rules_docker//docker/toolchain_container:toolchain_container.bzl",
    "language_tool_layer",
)
load("@io_bazel_rules_docker//docker/util:run.bzl", "container_run_and_extract")

package(default_visibility = ["//visibility:public"])

bzl_library(
    name = "lib",
    srcs = glob(["*.bzl"]),
)

# Download packages and store somewhere
# to make sure the build is stable
download_pkgs(
    name = "java_debs",
    image_tar = "@ubuntu2004//image",
    packages = [
        "ca-certificates-java",
        "openjdk-16-jdk-headless",
        "openjdk-16-jre-headless",
    ],
)

packages_metadata(
    name = "metadata",
    metadata_csv = ":java_debs_metadata.csv",
)

container_run_and_extract(
    name = "cacerts_tar",
    commands = [
        "apt-get update",
        "apt-get install -y ca-certificates-java",
        "tar -cvf /cacerts.tar --mtime='1970-01-01' /etc/ssl/certs/java/cacerts",
    ],
    extract_file = "/cacerts.tar",
    image = "@ubuntu2004//image",
)


JAVA_CLEANUP_COMMANDS = (
    "rm -rf " +
    # Still need to remove the nondeterministic cacerts which is generated when
    # `ca-certificates-java` is installed.
    "/etc/ssl/certs/java/cacerts " +
    "/tmp/hsperfdata_root/* " +
    "/*.deb"
)

language_tool_layer(
    name = "java-ltl",
    base = "@ubuntu2004//image",
    env = {
        "JAVA_HOME": "/usr/lib/jvm/java-15-openjdk-amd64",
    },
    installables_tar = "@ubuntu2004_java_debs//file",
    installation_cleanup_commands = JAVA_CLEANUP_COMMANDS,
    symlinks = {
        "/usr/bin/java": "/usr/lib/jvm/java-16-openjdk-amd64/bin/java",
    },
    tars = [
        "@ubuntu2004_java_cacerts//file",
    ],
)