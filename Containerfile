ARG MAJOR_VERSION="${MAJOR_VERSION:-stream10}"

FROM ghcr.io/ublue-os/config:latest AS config
FROM quay.io/centos-bootc/centos-bootc:$MAJOR_VERSION


#Install codecs, Workstation, EPEL, CRB, etc.
COPY build.sh /tmp/build.sh
RUN --mount=type=bind,from=config,src=/rpms,dst=/tmp/rpms chmod +x /tmp/build.sh && \
    /tmp/build.sh && \
    dnf clean all && \
    ostree container commit

# Just gotta get this green!
RUN bootc container lint
