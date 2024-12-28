ARG MAJOR_VERSION="${MAJOR_VERSION:-stream10}"

FROM ghcr.io/ublue-os/config:latest@sha256:ea9fb226fc54e5d0f8b3244285d439d4f83c65aaadab8fea3743eeaef64770e9 AS config
FROM quay.io/centos-bootc/centos-bootc:$MAJOR_VERSION


#Install codecs, Workstation, EPEL, CRB, etc.
COPY build.sh /tmp/build.sh
RUN --mount=type=bind,from=config,src=/rpms,dst=/tmp/rpms chmod +x /tmp/build.sh && \
    /tmp/build.sh && \
    dnf clean all && \
    ostree container commit

# Just gotta get this green!
RUN bootc container lint
