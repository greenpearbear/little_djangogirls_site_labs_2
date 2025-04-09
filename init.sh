#! /bin/sh

# User credentials
user=admin
email=admin@example.com
password=pass
#file=db/db.sqlite3

while true; do
	nohup python3 manage.py runserver 0.0.0.0:8000 &
	python3 manage.py migrate
	echo "from django.contrib.auth.models import User; User.objects.create_superuser('$user', '$email', '$password')" | python3 manage.py shell
done
