import os, sys, site

DEPLOYMENT = 'dev'

PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))
SITE_ROOT = os.path.abspath(os.path.join(PROJECT_ROOT, '..'))
sys.path.insert(0, os.path.join(PROJECT_ROOT,"apps"))
sys.path.insert(0, os.path.join(PROJECT_ROOT,"lib"))
sys.path.insert(0, PROJECT_ROOT)
#sys.path.insert(0, SITE_ROOT)

sys.stdout = sys.stderr

if PROJECT_ROOT not in sys.path:
    sys.path.append(PROJECT_ROOT)
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings.%s' % DEPLOYMENT

import django.core.handlers.wsgi

application = django.core.handlers.wsgi.WSGIHandler()