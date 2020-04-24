FROM gentoo/stage3-amd64:latest

COPY . /action/
WORKDIR /action

ENTRYPOINT ["/action/entrypoint.sh"]
