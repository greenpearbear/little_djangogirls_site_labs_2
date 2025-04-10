FROM python:3.11-alpine

WORKDIR /app

RUN addgroup -g 2000 testik \
 && adduser -u 2000 -G testik -s /bin/sh -D testik

RUN mkdir -p /app/db

COPY requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . .

RUN chmod +x /app/init.sh

EXPOSE 8000

USER testik

CMD ["/app/init.sh"]
