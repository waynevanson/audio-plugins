FROM rust

RUN apt-get update  \
    && \
    apt-get install -y \
    libasound2-dev \
    libgl-dev \ 
    libjack-dev \
    libxcb1-dev \
    libxcb-icccm4-dev \
    libxcursor-dev \
    libxkbcommon-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev \
    libx11-xcb-dev \
    libxcb-dri2-0-dev \
    curl \
    python3 \
    cmake \
    clang \
    gcc \
    g++ \
    zlib1g-dev \
    libmpc-dev \
    libmpfr-dev \
    libgmp-dev \
    gcc-mingw-w64 \
    && \
    rustup target add \
    x86_64-pc-windows-gnu \
    x86_64-apple-darwin \
    && \
    cargo install cross 


RUN git clone https://github.com/tpoechtrager/osxcross /usr/local/osxcross &&\
    cd /usr/local/osxcross && \ 
    wget -nc https://s3.dockerproject.org/darwin/v2/MacOSX10.10.sdk.tar.xz && \
    mv MacOSX10.10.sdk.tar.xz tarballs/ && \
    UNATTENDED=yes OSX_VERSION_MIN=10.7 ./build.sh 


ENV PATH "$(pwd)/osxcross/target/bin:$PATH"

WORKDIR /home/local/project

ENTRYPOINT ["/bin/bash"]