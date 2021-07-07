FROM debian:latest

RUN apt-get update -y
RUN apt-get install jq curl -y
COPY ddns-client /usr/local/bin