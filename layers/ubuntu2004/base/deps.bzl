load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004" not in excludes:
        container_pull(
            name = "ubuntu2004",
            digest = "sha256:0ac9ad647133d6f157e332a71dc3a96ddabe222e1f32d01550c8fa310efa7638",
            registry = "index.docker.io",
            repository = "dzag/ubuntu2004",
        )
