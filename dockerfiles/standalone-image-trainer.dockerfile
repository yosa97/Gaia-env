FROM diagonalge/kohya_latest:latest

# System dependencies
RUN apt-get update && apt-get install -y \
    vim \
    zip \
    wget \
    nano \
    htop \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /workspace
RUN mkdir -p /cache
RUN mkdir -p /app/checkpoints

WORKDIR /workspace

# Copy scripts
COPY scripts /workspace/scripts

ENTRYPOINT ["python3", "/workspace/scripts/image_trainer.py"]
