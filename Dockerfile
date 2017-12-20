FROM golang:1.9-alpine as build

RUN apk add --no-cache git
RUN go get github.com/golang/dep/cmd/dep

FROM alpine
RUN apk add --no-cache git
COPY --from=build /go/bin/dep /bin/dep
ENV GOROOT=/go
ENV GOPATH=/go
ENTRYPOINT ["/bin/dep"]
