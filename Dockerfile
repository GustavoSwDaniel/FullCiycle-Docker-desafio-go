FROM golang:1.20 AS builder

WORKDIR /usr/src/app

COPY . .
RUN go build -o hello-world hello-world.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/hello-world .

ENTRYPOINT ["./hello-world"]
