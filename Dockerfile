# Stage 1: Build the Rust Application
FROM rust:latest as builder

WORKDIR /app

# Copy the source code
COPY . .

# Build the application
RUN cargo build --release

# Stage 2: Create the Final Image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the built binary
COPY --from=builder /app/target/release/axum-server /usr/local/bin/axum-server

COPY src/static /app/static

RUN ls -la /app/static  # Debug: Check if files are copied correctly

RUN chmod +x /usr/local/bin/axum-server

EXPOSE 7777

ENTRYPOINT ["/usr/local/bin/axum-server"]
