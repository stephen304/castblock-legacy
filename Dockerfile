FROM golang:buster

WORKDIR /opt/castblock
COPY . .

RUN go get -u github.com/vishen/go-chromecast

RUN apt-get update && apt-get install -y jq bc diffutils coreutils bsdmainutils

CMD ["/opt/castblock/castblock"]
