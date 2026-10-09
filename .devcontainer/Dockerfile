FROM ubuntu:24.04

ENV LC_ALL="en_US.UTF-8"
ENV LC_CTYPE="en_US.UTF-8"
ENV LANG="en_US.UTF-8"

# Install gems here so the non-root user can write to them
ENV GEM_HOME="/usr/local/bundle"
ENV BUNDLE_PATH="/usr/local/bundle"
ENV PATH="/usr/local/bundle/bin:${PATH}"

ARG DEBIAN_FRONTEND="noninteractive"

# Make RUN commands fail if any subcommand does not succeed
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set up base image
RUN apt-get update; \
    # If tzdata is not installed here, the build gets stuck waiting for input
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        git \
        locales \
        lsb-release \
        ruby-dev \
        ruby-full \
        sudo \
        tzdata \
        vim \
        openssh-client \
        zlib1g-dev; \
    #--------------------
    # Generate the locale referenced by LANG/LC_ALL above
    #--------------------
    locale-gen en_US.UTF-8; \
    #--------------------
    # Create user
    #--------------------
    useradd -ms /bin/bash agile; \
    echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers; \
    echo "agile ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers; \
    #--------------------
    # Configure `root`s secure shell
    #--------------------

    mkdir -p "/root/.ssh"; \
    echo -e "Host *\tStrictHostKeyChecking no\n\n" > "/root/.ssh/config"; \
    chmod 0400 "/root/.ssh/config"; \
    rm -rf /var/lib/apt/lists/*

# Ruby is available from here on, so `gem` resolves
RUN gem install bundler jekyll --no-document; \
    mkdir -p "${GEM_HOME}"; \
    chown -R agile:agile "${GEM_HOME}"

USER agile
