FROM python:3.11-alpine

WORKDIR /app

RUN mkdir -p /app/db

COPY requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . .

RUN chmod +x /app/init.sh

#RUN python manage.py migrate blog

#RUN python manage.py createsuperuser

#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

EXPOSE 8000

CMD ["/app/init.sh"]
