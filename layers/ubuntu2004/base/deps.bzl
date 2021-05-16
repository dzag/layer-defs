load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

def deps():
    """Download dependencies required to use this layer."""
    excludes = native.existing_rules().keys()

    if "ubuntu2004" not in excludes:
        container_pull(
            name = "ubuntu2004",
            digest = "sha256:f3b4b1cb650b96c0a7cb98fdbaec1e02021c1ec1fc818bf85b32a6bfbfc23046",
            registry = "index.docker.io",
            repository = "dzag/ubuntu2004",
        )
