#! /bin/sh

# User credentials
user=admin
email=admin@example.com
password=pass
#file=db/db.sqlite3

nohup python3 manage.py runserver 0.0.0.0:8000 &

sleep 60 &&

python3 manage.py migrate &&

output=$(python3 manage.py shell -c "from django.contrib.auth.models import User; all_users = User.objects.values(); print(all_users[0]['is_superuser'])")

if [ "True" != "$output" ]; then
	echo "from django.contrib.auth.models import User; User.objects.create_superuser('$user', '$email', '$password')" | python3 manage.py shell
fi

wait

