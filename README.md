## P2P Pseudo Peer for Self-hosted LiveSync

> [!NOTE]
> I believe this feature has now been incorporated into the [Self-hosted LiveSync CLI](https://github.com/vrtmrz/obsidian-livesync/tree/main/src/apps/cli). Please let me know if anything is missing. This repository will be archived shortly.

This repository contains a P2P pseudo peer for self-hosted LiveSync, which is a Obsidian plugin for synchronising notes between devices. The pseudo peer acts as a `stable` node for synchronisation to keep items between devices in the P2P network, allowing users to synchronise their notes without an keep-alive client.

## Installation

### Prerequisites

- [Deno](https://deno.land/) (v2.2.10 to checked at the time of writing).
- If you are not on Linux, following will be required:
  - [Node.js](https://nodejs.org/) (v20.12.2 now).
  - [npm](https://www.npmjs.com/) (v10.5.0 now).

### How to use

1. Clone the repository:
   ```bash
   git clone http://github.com/vrtmrz/livesync-serverpeer.git --recursive
   cd livesync-serverpeer
   ```
2. Prepare your `.env` file:
   ```bash
   cp .env.sample .env
   vi .env
   ```
3. Install dependencies:
   ```bash
   deno task install # You also need to install node and npm dependencies
   # or deno task install-only-deno
   ```
4. Run the server:
   ```bash
   deno task dev
   ```

Note: do not use `pm2`. It is not compatible with Deno and will cause issues with the server.

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.
