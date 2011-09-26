# django-boilerplate-layout

I've been working on my first django project. After many many many MANY file layout changes trying to find the what I believe to be the best layout for a massive project, I finally came across: [this layout by Zachary Voase](http://blog.zacharyvoase.com/2010/02/03/django-project-conventions/) that makes sense with how I feel webapps should be developed.
## Requirements
- Django 1.3.* at least for this version. As new versions of Django come out, I hope to be able to update this so that you can always use the most modern version.

## Installation
cd into your development directory and clone my respority as so
	git clone git://github.com/cmsimike/django-boilerplate-layout.git dev.example.com (change example to whatever your site name is).

Delete the .git directory in dev.example.com; and create your own git repo, if you'd like, and start coding. It is my hope that you can almost just start using this without much fuss.

This will clone this repository into a directory named dev.example.com. This is supposed to mimic your deployment. My idea is that webapps will reside in /home/&lt;deployment&gt;.example.com/. That way you can have things like /home/dev.example.com, /home/staging.example.com and /home/example.com. 
	
Included in this project is a Vagrantfile to emulate a development enviornment.
