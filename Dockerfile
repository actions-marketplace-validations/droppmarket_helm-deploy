FROM alpine:3.16.0

ENV BASE_URL="https://get.helm.sh"

ENV HELM_2_FILE="helm-v2.17.0-linux-amd64.tar.gz"
ENV HELM_3_FILE="helm-v3.8.1-linux-amd64.tar.gz"


ENV PYTHONPATH "/usr/lib/python3.11/site-packages/"

RUN apk add --no-cache ca-certificates --repository http://dl-3.alpinelinux.org/alpine/edge/community/
RUN apk add --no-cache jq curl bash nodejs aws-cli

    # Install helm version 3:
RUN curl -L ${BASE_URL}/${HELM_3_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/bin/helm3 && \
    chmod +x /usr/bin/helm3 && \
    rm -rf linux-amd64


COPY . /usr/src/
ENTRYPOINT ["node", "/usr/src/index.js"]
