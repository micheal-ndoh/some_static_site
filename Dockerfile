
FROM rust:latest as builder

WORKDIR /app

COPY . .

RUN cargo build --release

FROM scratch

COPY --from=builder /app/target/release/axum-server /usr/local/bin/axum-server

# Copy a
COPY src/static /app/static

# Debug: Check if files are copied correctly
RUN ls -la /app/static


RUN chmod +x /usr/local/bin/axum-server

EXPOSE 7777

ENTRYPOINT ["/usr/local/bin/axum-server"]
