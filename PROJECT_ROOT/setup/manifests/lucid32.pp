stage { "pre": before => Stage["main"] }
class python {
	package {							       
		"build-essential": ensure => "latest";				
		"python": ensure => "latest";			       		   
		"python-setuptools": ensure => "latest", require => Package["python"];
		"mysql-server": ensure => "latest";
		"vim": ensure => "latest";
		"htop": ensure => "latest";
		"memcached": ensure => "latest";
		"git-core": ensure => "latest";
	}
    
    exec { "apt-get update": 
        path => "/usr/local/bin:/usr/bin:/bin",
    }
	group { "puppet":
      ensure => "present",
    }	

   
    exec { "easy_install pip":
		path => "/usr/local/bin:/usr/bin:/bin",
		require => Package["python-setuptools"],
		subscribe => Package["python-setuptools"],
		unless => "which pip",
	}
	
	exec { "sudo apt-get -y build-dep python-mysqldb":
       path => "/usr/local/bin:/usr/bin:/bin",
       require => Package["build-essential", "mysql-server"],
    }
}									   
class { "python": stage => "pre" }

#package { "fabric":
#	ensure => "0.9.3",
#	provider => pip,
#}

#package { "south":
#	ensure => "0.7.2",
#	provider => pip,
#}

package { "virtualenv":
	ensure => "latest",
	provider => pip,
}

package {
	"apache2-mpm-worker":
		ensure => "latest";
	"libapache2-mod-wsgi":
		ensure => "latest";
}

#package {
#	"mysql-python":
#	ensure => "latest",
#	provider => pip,
#	require => Package["libmysqlclient-dev"]
#}

package {
	"libmysqlclient-dev":
	ensure => "latest",
	require => Package["mysql-server"],
}

file {
	#"/etc/apache2/sites-available/website":
	#	ensure => "/home/website/dev/conf/apache-django-dev",
	#	require => Package["apache2-mpm-worker"];
	"/etc/apache2/sites-enabled/001-website":
		ensure => "/home/dev.example.com/PROJECT_ROOT/conf/dev.example.com.conf",
		require => Package["apache2-mpm-worker"];
	"/etc/apache2/sites-enabled/000-default":
		ensure => absent,
		require => Package["apache2-mpm-worker"];
	#"/usr/local/share/wsgi/mysite/mysite.wsgi":
	#	content => template("/tmp/vagrant-puppet/modules-0/templates/mysite.wsgi.erb"),
	#	ensure => file;
}

service { "apache2":
	enable => true,
	ensure => running,
	require => Package["apache2-mpm-worker"],
	subscribe => [
		Package[
			"apache2-mpm-worker",
			"libapache2-mod-wsgi"],
		File[
			"/etc/apache2/sites-enabled/001-website",
			"/etc/apache2/sites-enabled/000-default"]],
}

exec { "create-website-dev-db":
      unless => "/usr/bin/mysql -utddevu -ppassword tddev",
      command => "/usr/bin/mysql -uroot -ppassword -e \"create database tddev; grant all on tddev.* to 'tddevu'@'%' identified by 'password';\"",
      require => Service["mysql"],
    }
    
exec { "set-mysql-password":
  unless => "mysqladmin -uroot -ppassword status",
  path => ["/bin", "/usr/bin"],
  command => "mysqladmin -uroot password password",
  require => Service["mysql"],
}

service { "mysql":
  enable => true,
  ensure => running,
  require => Package["mysql-server"],
}