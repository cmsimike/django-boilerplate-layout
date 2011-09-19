#!/bin/bash
virtualenv --no-site-packages .
source bin/activate
cd website 
cd setup
pip install -r requirements.txt
cd ..
cd ..
python twitdegree/manage.py syncdb --settings website.settings.dev
python twitdegree/manage.py migrate website --settings website.settings.dev
#chown -R www-data:www-data .
#python manage.py --settings 
