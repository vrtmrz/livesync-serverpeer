FROM denoland/deno:bin-2.5.6 AS deno

FROM node:22.14-bookworm-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

COPY --from=deno /deno /usr/local/bin/deno

WORKDIR /app

COPY package.json package-lock.json deno.json deno.lock ./

RUN deno task install

COPY .git .git
COPY .gitmodules .gitmodules
RUN git submodule update --init --recursive

COPY src ./src
COPY dat ./dat

CMD ["deno", "task", "main"]