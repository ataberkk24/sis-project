# Dockerfile skeleton for the SIS C++ application.
# Week 2 turns this into a multi-stage build (build stage + small runtime stage).

FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential cmake pkg-config libpqxx-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src
COPY CMakeLists.txt ./
COPY include/ include/
COPY src/ src/

RUN cmake -S . -B build -DCMAKE_BUILD_TYPE=Release \
    && cmake --build build \
    && cmake --install build --prefix /usr/local

ENTRYPOINT ["sis-app"]
CMD ["--help"]
