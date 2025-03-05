FROM rust:latest as builder

WORKDIR /app

RUN rustup target add x86_64-unknown-linux-musl

COPY . .

COPY cargo.toml cargo.lock ./

COPY templates ./templates

RUN cargo build --release

RUN cargo install --target x86_64-unknown-linux-musl --path .

FROM scratch

COPY --from=builder /app/target/release/some_static_site /usr/share/nginx/html

EXPOSE 8080

CMD ["./target/release/some_static_site"]

