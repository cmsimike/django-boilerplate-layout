from django.conf.urls.defaults import patterns, include, url

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'testt.views.home', name='home'),
    # url(r'^testt/', include('testt.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)

# uncomment for django to serve up static files. 
# make sure to set settings.STATIC_ROOT correctly.
# I don't think that is what settings.STATIC_ROOT is for anyway.

#urlpatterns += patterns('',
#    url(r'^css/(?P<path>.*)$', 'django.views.static.serve', {
#        'document_root': settings.STATIC_ROOT + 'css',
#    }),
#    url(r'^js/(?P<path>.*)$', 'django.views.static.serve', {
#        'document_root': settings.STATIC_ROOT + 'js',
#    }),
#    url(r'^img/(?P<path>.*)$', 'django.views.static.serve', {
#        'document_root': settings.STATIC_ROOT + 'img',
#    }),
#)