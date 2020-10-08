FROM elixir:1.10 as elixir

ARG TODO_DB_HOSTNAME
ENV TODO_DB_HOSTNAME=$TODO_DB_HOSTNAME

# Configure apt
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils 2>&1 \
    && apt-get install -yqq \ 
    git \ 
    locales \
    lsb-release \
    procps \ 
    zsh

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG="en_US.UTF-8"

# Installing oh-my-zsh for better terminal experience
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

# Clean up
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
ENV DEBIAN_FRONTEND=dialog

# Elixir
ENV HEX_REBAR_UPDATE_AT=2019-01-15
RUN mix do local.rebar --force, local.hex --force

ENV SHELL /bin/zsh 