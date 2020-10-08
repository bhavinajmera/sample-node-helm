FROM docker.io/library/centos:centos7

ENV VERIFY_CHECKSUM=false

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
