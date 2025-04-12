FROM python:3.11-alpine

ARG USER
ARG EMAIl
ARG PASSWORD

ENV USER=${USER}
ENV EMAIl=${EMAIL}
ENV PASSWORD=${PASSWORD}

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN addgroup -g 2000 testik \
 && adduser -u 2000 -G testik -s /bin/sh -D testik \
 && mkdir -p /app/db \
 && pip install -r requirements.txt \
 && chown -R testik /app

COPY . .

RUN chmod +x /app/init.sh

EXPOSE 8000

VOLUME /app/db

USER testik

CMD ["/app/init.sh"]
