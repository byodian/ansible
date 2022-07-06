FROM ubuntu:focal
ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
ENV PATH="~/.local/.npm-global/bin:${PATH}"
ENV PATH="~/.local/n/bin:${PATH}"
ENV N_PREFIX="$HOME/.local/n"
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-add-repository -y ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-get install -y curl git ansible neovim build-essential nodejs npm
COPY . .
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

