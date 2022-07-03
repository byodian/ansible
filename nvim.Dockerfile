FROM ubuntu:focal
ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-add-repository -y ppa:neovim-ppa/unstable && \
    apt-get update && \
    apt-get install -y curl git ansible neovim build-essential
COPY . .
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

