ARG MAJOR_VERSION="${MAJOR_VERSION:-40}"

FROM ghcr.io/starlit-os/base:$MAJOR_VERSION


#Install codecs, Workstation, EPEL, CRB, etc.
COPY build.sh /tmp/build.sh
RUN /tmp/build.sh && \
    dnf clean all && \
    ostree container commit

# Just gotta get this green!
RUN bootc container lint
