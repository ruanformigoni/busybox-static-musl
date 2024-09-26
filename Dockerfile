FROM alpine:latest

# Requirements
RUN apk add build-base linux-headers git upx

# Source
RUN git clone https://github.com/mirror/busybox.git
WORKDIR busybox

# Static binary
ENV LDFLAGS="-static"

# Build
RUN make defconfig
RUN make

# Strip
RUN strip -s -R .comment -R .gnu.version --strip-unneeded busybox

# Compress
RUN upx --ultra-brute --no-lzma busybox
