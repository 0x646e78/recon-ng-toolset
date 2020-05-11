FROM python:3.7-alpine

RUN mkdir -p /recon-ng

WORKDIR /recon-ng

ADD ./recon-ng/REQUIREMENTS /recon-ng/REQUIREMENTS
ADD ./recon-ng/VERSION /recon-ng/VERSION
ADD ./recon-ng/recon /recon-ng/recon
ADD ./recon-ng/recon-ng /recon-ng/recon-ng
ADD ./recon-ng/recon-cli /recon-ng/recon-cli
ADD ./recon-ng/recon-web /recon-ng/recon-web

RUN apk add --no-cache --virtual .build-deps gcc libc-dev libxslt-dev &&\
    apk add --no-cache libxslt &&\
    pip install --no-cache-dir -r REQUIREMENTS &&\
    rm REQUIREMENTS &&\
    apk del .build-deps
#libressl-dev musl-dev &&\
#pip install M2Crypto &&\
