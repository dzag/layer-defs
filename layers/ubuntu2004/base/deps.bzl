load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004" not in excludes:
        container_pull(
            name = "ubuntu2004",
            digest = "sha256:6f2fb2f9fb5582f8b587837afd6ea8f37d8d1d9e41168c90f410a6ef15fa8ce5",
            registry = "index.docker.io",
            repository = "library/ubuntu",
        )
