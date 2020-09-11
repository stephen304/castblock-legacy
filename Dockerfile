FROM golang:buster
WORKDIR /opt/go-chromecast

RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/vishen/go-chromecast.git . && CGO_ENABLED=0 go build

FROM alpine:latest
WORKDIR /opt/castblock

COPY --from=0 /opt/go-chromecast/go-chromecast /bin/
COPY . .

# bash is needed to avoid worrying about porting to ash
# grep is needed for gnu grep for -P
RUN apk add --update bash grep jq bc curl diffutils coreutils util-linux

CMD ["/opt/castblock/castblock"]
