FROM alpine:latest

# Requirements
RUN apk add build-base linux-headers git

# Source
RUN git clone https://github.com/mirror/busybox.git
WORKDIR busybox

# Static binary
ENV LDFLAGS="-static"

# Build
RUN make defconfig
RUN make -j"$(nproc)"
