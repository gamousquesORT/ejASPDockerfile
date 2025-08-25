# Start from the official Golang image for building
FROM golang:1.21-alpine AS builder
RUN apk add --no-cache git
RUN git clone https://github.com/gamousquesORT/ejASPDockerfile.git /app
WORKDIR /app
RUN go mod init || true
RUN go build -o server main.go

# Use a minimal image for running the app
FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/server ./
EXPOSE 8080
CMD ["./server"]
