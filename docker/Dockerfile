FROM python:3.8-alpine

RUN mkdir -p /recon-ng

WORKDIR /recon-ng

COPY ./recon-ng/REQUIREMENTS REQUIREMENTS
COPY ./recon-ng/VERSION VERSION

COPY ./recon-ng/recon ./recon
COPY ./recon-ng/recon-ng ./recon-ng
COPY ./recon-ng/recon-cli ./recon-cli
COPY ./recon-ng/recon-web ./recon-web

RUN apk add --no-cache --virtual .build-deps gcc libc-dev libxslt-dev &&\
    apk add --no-cache libxslt &&\
    pip install --no-cache-dir -r REQUIREMENTS &&\
    rm REQUIREMENTS &&\
    apk del .build-deps
#TODO: M2Crypto
#libressl-dev musl-dev &&\
#pip install M2Crypto &&\

ENTRYPOINT [ "./recon-ng" ]
