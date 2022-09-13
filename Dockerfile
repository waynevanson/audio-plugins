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
    # another linker for mac?
    gcc-mingw-w64 \
    && \
    rustup target add \
    x86_64-pc-windows-gnu \
    x86_64-apple-darwin \
    && \
    cargo install cross 

WORKDIR /home/local/project
ENTRYPOINT ["/bin/bash"]