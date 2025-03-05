FROM rust:latest as builder

WORKDIR /app

RUN rustup target add x86_64-unknown-linux-musl

COPY . .

COPY Cargo.toml Cargo.lock ./

RUN cargo build --release

RUN cargo install --target x86_64-unknown-linux-musl --path .

FROM scratch

COPY --from=builder /app/target/release/axum-server /usr/share/nginx/html

EXPOSE 8080

CMD ["./target/release/axum-server"]
