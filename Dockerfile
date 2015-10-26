FROM gpmidi/centos-5.8

RUN yum update -y 

# INSTALAÇÃO PACOTES WGET, GCC E MAKE
RUN yum install -y wget gcc make 

# INSTALAÇÃO PHP 5.4.45
#ADD latest.rpm /
#RUN rpm -Uvh http://mirror.webtatic.com/yum/el5/latest.rpm
#RUN rpm -ivh latest.rpm

RUN yum -y install php54w.x86_64 php54w-cli.x86_64 php54w-common.x86_64 php54w-gd.x86_64 php54w-ldap.x86_64 php54w-mbstring.x86_64 php54w-mcrypt.x86_64 php54w-pdo.x86_64 php54w-pgsql.x86_64 php54w-mysql.x86_64 

# INSTALAÇÃO APACHE 2, POSTGRESQL E MYSQL
RUN yum -y install apache2 
RUN yum -y install postgresql postgresql-server 
RUN yum -y install mysql55-mysql.x86_64 mysql55-mysql-server.x86_64

# INSTALAÇÃO CLIENT ORACLE OCI8 E PHP PEAR
#RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm
#RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
#RUN yum -y install php-pear

#ADD oracle-instantclient11.2-basic-11.2.0.4.0-1.i386.rpm /
#ADD oracle-instantclient11.2-devel-11.2.0.4.0-1.i386.rpm /
#RUN rpm -Uvh oracle-instantclient11.2-basic-11.2.0.4.0-1.i386.rpm 
#RUN rpm -Uvh oracle-instantclient11.2-devel-11.2.0.4.0-1.i386.rpm 
#RUN pecl install oci8

# INFORMAÇÕES DE VERSÃO 
RUN cat /etc/redhat-release
RUN php -v
RUN httpd -v
RUN php -i

#WORKDIR /var
#RUN pwd
#RUN ls	

#LIBERAÇÃO DE PORTAS 80 E 443
EXPOSE 80 443

