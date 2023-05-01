FROM gcc:10.4

# TODO: remove unneeded installs
RUN apt-get update \
    && apt-get install -qy \
        git \
        cmake \
        make \
        g++ \
        lcov \
        gettext-base \
        jq \
        wget \
        build-essential \
        binutils \
        gcc-multilib \
        g++-multilib \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# to allow execution from Github Actions
ENV BUILD_WORKSPACE=/github/workspace

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]