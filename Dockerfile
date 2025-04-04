FROM python:3.11-alpine

WORKDIR /app

RUN mkdir -p /app/db

COPY . .

EXPOSE 8000

RUN pip install -r requirements.txt

RUN python manage.py migrate blog

RUN python manage.py createsuperuser

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
