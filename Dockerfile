FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libx11-6 \
    libxcursor1 \
    libxrandr2 \
    libxi6 \
    libgl1 \
    libfontconfig1 \
    libglib2.0-0 \ 
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/godotengine/godot/releases/download/4.4-stable/Godot_v4.4-stable_linux.x86_64.zip -O /tmp/godot.zip && \
    unzip /tmp/godot.zip -d /usr/local/bin && \
    rm /tmp/godot.zip && \
    chmod +x /usr/local/bin/Godot_v4.4-stable_linux.x86_64 && \
    ln -s /usr/local/bin/Godot_v4.4-stable_linux.x86_64 /usr/local/bin/godot

CMD ["godot", "--headless"]
