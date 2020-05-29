FROM hayd/alpine-deno:1.0.2 as base

EXPOSE 3000

FROM base as app1

WORKDIR /app

COPY ./src/app1/main.ts .
RUN deno cache main.ts

CMD ["run", "--allow-net", "main.ts"]

FROM base as app2

WORKDIR /app

COPY ./src/app2/main.ts .
RUN deno cache main.ts

CMD ["run", "--allow-net", "main.ts"]
