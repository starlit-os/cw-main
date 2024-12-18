ARG MAJOR_VERSION="${CENTOS_MAJOR_VERSION:-stream10}"

FROM quay.io/centos-bootc/centos-bootc:$MAJOR_VERSION

# See https://github.com/centos-workstation/achillobator/issues/3
RUN mkdir -p /var/roothome

COPY build.sh /tmp/build.sh

RUN chmod +x /tmp/build.sh &&\
    /tmp/build.sh && \
    dnf clean all && \
    ostree container commit

RUN bootc container lint
