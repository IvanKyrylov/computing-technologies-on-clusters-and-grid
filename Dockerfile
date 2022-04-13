FROM golang:1.18.1-alpine3.15 as builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o ./cmd/service ./cmd

FROM alpine:3.15.0
WORKDIR /app
COPY --from=builder /app/cmd/service /app/service
CMD ./service