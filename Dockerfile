FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential sudo && \
    apt-get clean autoclean && \
    apt-get autoremove -y

FROM base AS prime
ARG TAGS
RUN addgroup --gid 1000 byodian
RUN adduser --gecos byodian --gid 1000 --uid 1000 --disabled-password byodian
USER byodian
WORKDIR /home/byodian

FROM prime
COPY . .
# CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
