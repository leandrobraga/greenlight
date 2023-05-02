FROM golang:1.20.3-alpine

WORKDIR /greenlight

RUN go install github.com/cosmtrek/air@latest
RUN go install -v golang.org/x/tools/gopls@latest

RUN apk add git

COPY . .

RUN go mod tidy
