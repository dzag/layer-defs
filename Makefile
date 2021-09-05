build-debs-2004:
	bazel build \
		//layers/ubuntu2004/bazel:bazel_debs \
		//layers/ubuntu2004/clang:clang_debs \
		//layers/ubuntu2004/docker:docker_debs \
		//layers/ubuntu2004/java:java_debs \
		//layers/ubuntu2004/java:cacerts_tar \
		//layers/ubuntu2004/python:python_debs