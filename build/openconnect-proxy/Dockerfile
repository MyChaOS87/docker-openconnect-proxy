FROM golang:alpine as builder

RUN go install github.com/nadoo/glider@v0.15.0

RUN update-ca-certificates

COPY entrypoint.sh /usr/bin/

FROM alpine
RUN apk add --no-cache ca-certificates openconnect
COPY --from=builder /go/bin/glider /usr/bin/entrypoint.sh /usr/bin/
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
CMD ["openconnect"]