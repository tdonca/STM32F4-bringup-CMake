FROM ubuntu:22.04

RUN apt-get update \
    && apt-get -y install \
    wget \
    bzip2 \
    git \
    cmake

WORKDIR /opt/toolchains

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 \
   && tar xvf gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 \
   && rm gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2

ENV PATH="/opt/toolchains/gcc-arm-none-eabi-10.3-2021.10/bin:$PATH"

WORKDIR /home/workspace

# TODO: convert this build container into non-interactive mode to use in CI workflow
# CMD ["bash", "docker-entrypoint.sh"]

