FROM rust:alpine AS build

WORKDIR /code
COPY . .

RUN cargo build --release

FROM alpine

WORKDIR /app
COPY --from=build /code/target/release/{{project-name}} .

CMD [ "/app/{{project-name}}" ]
