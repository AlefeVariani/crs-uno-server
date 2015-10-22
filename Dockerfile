FROM gpmidi/centos-5.8

RUN yum update -y 

RUN yum install -y wget gcc make 
RUN rpm -Uvh http://mirror.webtatic.com/yum/el5/latest.rpm

RUN yum -y install php54w.x86_64 php54w-cli.x86_64 php54w-common.x86_64 php54w-gd.x86_64 php54w-ldap.x86_64 php54w-mbstring.x86_64 php54w-mcrypt.x86_64 php54w-pdo.x86_64 php54w-pgsql.x86_64 php54w-mysql.x86_64 

#RUN wget http://museum.php.net/php5/php-5.4.17.tar.gz
#RUN tar xf php-5.4.17.tar.gz
#RUN cd php-5.4.17/
#RUN aclocal
#RUN ./configure
#RUN make
#RUN make test -n
#RUN make install
#RUN echo -e "; Enable mcryot extension module\nextension=mcrypt.so" | tee /etc/php.d/mcrypt.ini

#RUN wget http://www.apache.org/dist/httpd/httpd-2.2.31.tar.gz
#RUN tar zxvf httpd-2.2.31.tar.gz
#RUN cd httpd-2.2.31
#RUN ./configure --enable-so --enable-rewrite=shared
#RUN make
#RUN make install
#RUN cd ..

RUN yum -y install apache2 
RUN yum -y install postgresql postgresql-server 
RUN yum -y install mysql55-mysql.x86_64 mysql55-mysql-server.x86_64

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
RUN yum -y install php-pear

ADD oracle-instantclient11.2-basic-11.2.0.4.0-1.i386.rpm /
ADD oracle-instantclient11.2-devel-11.2.0.4.0-1.i386.rpm /

RUN rpm -Uvh oracle-instantclient11.2-basic-11.2.0.4.0-1.i386.rpm 
RUN rpm -Uvh oracle-instantclient11.2-devel-11.2.0.4.0-1.i386.rpm 
#RUN pecl install oci8

#RUN yum install -y unzip libaio-dev
#RUN apt-get clean -y

# Oracle instantclient ADD instantclient-basic-linux.x64-12.1.0.2.0.zip /tmp/
#ADD instantclient-sdk-linux.x64-11.2.0.2.0.zip /tmp/
#ADD instantclient-sqlplus-linux.x64-11.2.0.2.0.zip /tmp/
#RUN unzip /tmp/instantclient-basic-linux.x64-11.2.0.2.0.zip -d /usr/local/
#RUN unzip /tmp/instantclient-sdk-linux.x64-11.2.0.2.0.zip -d /usr/local/
#RUN unzip /tmp/instantclient-sqlplus-linux.x64-11.2.0.2.0.zip -d /usr/local/
#RUN ln -s /usr/local/instantclient_11_2 /usr/local/instantclient
#RUN ln -s /usr/local/instantclient/libclntsh.so.11.2 /usr/local/instantclient/libclntsh.so
#RUN ln -s /usr/local/instantclient/sqlplus /usr/bin/sqlplus
#RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8
#RUN echo "extension=oci8.so" > /etc/php5/apache2/conf.d/30-oci8.ini

RUN cat /etc/redhat-release
RUN php -v
RUN httpd -v
RUN php -i
#WORKDIR /var
#RUN pwd
#RUN ls	

EXPOSE 80 443
