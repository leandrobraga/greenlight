FROM golang:1.20.6-alpine

WORKDIR /greenlight

RUN go install github.com/cosmtrek/air@latest
RUN go install -v golang.org/x/tools/gopls@latest
RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

RUN apk add git
RUN apk add make

COPY . .

RUN go mod tidy
