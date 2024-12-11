FROM golang:1.23.4

WORKDIR /app

COPY . .

RUN go mod tidy


COPY test.db /app/test.db


EXPOSE 8080


ENTRYPOINT ["go", "run", "main.go"]