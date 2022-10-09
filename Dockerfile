FROM centos:latest
MAINTAINER ANKUR
WORKDIR /var/www/html/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y  httpd \
    zip \
    unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/moto.zip /var/www/html
RUN unzip moto.zip
RUN rm -rf moto.zip
RUN cp -r moto-html/* .
RUN rm -rf moto-html/
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
EXPOSE 80
