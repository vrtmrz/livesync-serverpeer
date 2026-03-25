## P2P Pseudo Peer for Self-hosted LiveSync

> [!NOTE]
> I believe this feature has now been incorporated into the [Self-hosted LiveSync CLI](https://github.com/vrtmrz/obsidian-livesync/tree/main/src/apps/cli). Please let me know if anything is missing. This repository will be archived shortly.

This repository contains a P2P pseudo peer for self-hosted LiveSync, which is a Obsidian plugin for synchronising notes between devices. The pseudo peer acts as a `stable` node for synchronisation to keep items between devices in the P2P network, allowing users to synchronise their notes without an keep-alive client.

## Installation

### Docker (Recommended)

The easiest way to run the server is using Docker:

1. Clone the repository:
   ```bash
   git clone https://github.com/vrtmrz/livesync-serverpeer.git --recursive
   cd livesync-serverpeer
   ```

2. Prepare your `.env` file:
   ```bash
   cp .env.sample .env
   vi .env
   ```

3. Run with Docker:
   ```bash
   docker run -d --name livesync-serverpeer \
     --env-file .env \
     -p 3000:3000 \
     --restart unless-stopped \
     ghcr.io/vrtmrz/livesync-serverpeer:latest
   ```

   Or build and run locally:
   ```bash
   docker build -t livesync-serverpeer .
   docker run -d --name livesync-serverpeer \
     --env-file .env \
     -p 3000:3000 \
     --restart unless-stopped \
     livesync-serverpeer
   ```

### Manual Installation

#### Prerequisites

- [Deno](https://deno.land/) (v2.2.10 or later)
- If you are not on Linux, following will be required:
  - [Node.js](https://nodejs.org/) (v20.12.2 or later)
  - [npm](https://www.npmjs.com/) (v10.5.0 or later)

#### How to use

1. Clone the repository:
   ```bash
   git clone https://github.com/vrtmrz/livesync-serverpeer.git --recursive
   cd livesync-serverpeer
   ```
2. Prepare your `.env` file:
   ```bash
   cp .env.sample .env
   vi .env
   ```
3. Install dependencies:
   ```bash
   deno task install
   ```
4. Run the server:
   ```bash
   deno task dev
   ```

Note: do not use `pm2`. It is not compatible with Deno and will cause issues with the server.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.
