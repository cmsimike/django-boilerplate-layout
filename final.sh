#!/bin/bash
virtualenv --no-site-packages .
source bin/activate
cd PROJECT_ROOT 
cd setup
pip install -r requirements.txt
cd ..
cd ..
python PROJECT_ROOT/manage.py syncdb --settings settings.dev
python PROJECT_ROOT/manage.py migrate website --settings settings.dev
python PROJECT_ROOT/manage.py runserver 0.0.0.0:9000 --settings settings.dev
#chown -R www-data:www-data .
#python manage.py --settings 
