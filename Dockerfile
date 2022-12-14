FROM ubuntu:latest
RUN apt-get update
RUN apt-get install git curl -y

WORKDIR /root/
COPY . .
RUN chmod a+x bootstrap.sh
RUN ls -la
RUN pwd
RUN ls $HOME

ENTRYPOINT ./bootstrap.sh && zsh 