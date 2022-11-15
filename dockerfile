FROM golang AS builder

WORKDIR /app
COPY . .

RUN go mod init lima08/go-challenge
RUN ["go", "build", "."]


RUN rm -rf go.mo main.go

FROM scratch

COPY --from=builder  ./app .

CMD ["./go-challenge"]



