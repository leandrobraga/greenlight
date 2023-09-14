FROM golang:1.20.6-alpine

WORKDIR /greenlight

RUN go install github.com/cosmtrek/air@latest
RUN go install -v golang.org/x/tools/gopls@latest
RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
RUN go install honnef.co/go/tools/cmd/staticcheck@latest

RUN apk add git
RUN apk add make
RUN apk add gcc
RUN apk add alpine-sdk

ARG CGO_ENABLED=1

COPY . .

RUN go mod tidy
