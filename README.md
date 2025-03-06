# Rust Server with Docker

This project sets up a Rust-based HTTP server inside a Docker container.

## Prerequisites

Ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Rust](https://www.rust-lang.org/tools/install) (for local development)

## Building the Docker Image

Run the following command to build the Docker image:

```sh
docker build -t stephan-web .
```

## Running the Container

To run the container and expose the server on port `8989`, use:

```sh
docker run -p 8989:7777 --name stephan-web my-rust-app
```

Now, your server should be accessible at:

```sh
http://localhost:8989
```

Your Rust server is now running in a Docker container and accessible on port 8989! 🚀

or

```sh
docker run -p 8989:7777 ghcr.io/dericko681/some_static_site
```

