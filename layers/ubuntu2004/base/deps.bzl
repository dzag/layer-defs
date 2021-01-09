load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004" not in excludes:
        container_pull(
            name = "ubuntu2004",
            digest = "sha256:4e4bc990609ed865e07afc8427c30ffdddca5153fd4e82c20d8f0783a291e241",
            registry = "index.docker.io",
            repository = "library/ubuntu",
        )
