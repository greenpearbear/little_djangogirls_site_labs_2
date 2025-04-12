#! /bin/sh

nohup python3 manage.py runserver 0.0.0.0:8000 &

output=$(python3 manage.py shell -c "from django.contrib.auth.models import User; all_users = User.objects.values(); print(all_users[0]['is_superuser'])")

if [ "True" != "$output" ]; then
	echo "from django.contrib.auth.models import User; User.objects.create_superuser('$USER', '$EMAIL', '$PASSWORD')" | python3 manage.py shell
fi
