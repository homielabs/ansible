FROM centos

ENV container docker
ENV ANSIBLE_CONFIG /work/ansible.cfg

RUN yum install -y epel-release
RUN yum install -y ansible
