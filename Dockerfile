FROM golang:1.11-alpine as builder

WORKDIR /go/src/tlsrouter
RUN apk --no-cache add git
RUN go get github.com/palager/tcpproxy/cmd/tlsrouter

FROM alpine:latest
COPY --from=builder /go/bin/tlsrouter /bin

CMD ["/bin/tlsrouter"]

