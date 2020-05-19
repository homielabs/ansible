FROM alpine

ENV container docker
ENV ANSIBLE_CONFIG /work/ansible.cfg

RUN apk add ansible bash
