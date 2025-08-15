# Stage 1: Build the Deno binary
FROM denoland/deno:bin-2.2.11 AS builder
WORKDIR /app

# Copy project files
COPY deno.json .
COPY lib ./lib
COPY src ./src
COPY dat ./dat

# Compile the Deno app into a standalone binary
RUN deno compile \
    --allow-all \
    --output livesync-serverpeer \
    src/main.ts

# Stage 2: Minimal runtime image
FROM gcr.io/distroless/cc AS runner
WORKDIR /app

# Copy compiled binary from the builder stage
COPY --from=builder /app/livesync-serverpeer /app/livesync-serverpeer

# Default command to run the binary
CMD ["./livesync-serverpeer"]
