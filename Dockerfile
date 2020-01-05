FROM ubuntu:xenial
RUN apt-get update
# Install apache
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils 
RUN a2enmod rewrite
RUN apt-get clean
COPY conf.d/ /etc/apache2/conf.d/
COPY conf.d/vhost.conf /etc/apache2/sites-enabled/000-default.conf
# Copy apache vhost file to proxy requests
RUN echo "Include /etc/apache2/sites-enabled/000-default.conf" \
>> /etc/apache2/apache2.conf
COPY modules/ /etc/apache2/modules/
COPY conf.modules.d/ /etc/apache2/conf.modules.d/
COPY public_html/ /var/www/html/public_html/
EXPOSE 80
CMD apachectl -D FOREGROUND


