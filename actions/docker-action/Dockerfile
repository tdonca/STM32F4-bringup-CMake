# # Container image that runs your code
# FROM alpine:3.10

# # Copies your code file from your action repository to the filesystem path `/` of the container
# COPY entrypoint.sh /entrypoint.sh

# # Code file to execute when the docker container starts up (`entrypoint.sh`)
# ENTRYPOINT ["/entrypoint.sh"]

FROM ubuntu:22.04

RUN apt-get update \
    && apt-get -y install \
    wget \
    bzip2 \
    git \
    cmake

RUN mkdir -p /opt/toolchains/ \
    && cd /opt/toolchains \
    && wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 \
    && tar xvf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 \
    && rm gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2

ENV PATH="/opt/toolchains/gcc-arm-none-eabi-10.3-2021.10/bin:$PATH"
# to allow execution from Github Actions
ENV BUILD_WORKSPACE=/github/workspace

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# TODO: convert this build container into non-interactive mode to use in CI workflow
# CMD ["bash", "docker-entrypoint.sh"]

