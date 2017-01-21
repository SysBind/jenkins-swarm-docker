FROM csanchez/jenkins-swarm-slave:latest

USER root
RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
    && echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list \
    && wget https://www.dotdeb.org/dotdeb.gpg \
    && apt-key add dotdeb.gpg \
    && apt-get update -y \
    && apt-get -y --no-install-recommends install php7.0 php7.0-mysql php7.0-curl php7.0-pgsql php7.0-intl php7.0-mbstring php7.0-mcrypt php7.0-xml php7.0-iconv php7.0-zip php7.0-cli php7.0-gd php7.0-dev php-pear libsasl2-dev\
    && apt-get -y install postgresql locales \
    && locale-gen en_AU.UTF-8 \
    && echo "en_AU.UTF-8 UTF-8"> /etc/locale.gen \
    && echo "LC_TIME=\"en_AU.UTF-8\"" >> /etc/default/locale \
    && locale-gen \
    && update-locale \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
	&& php composer-setup.php --install-dir=/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"
USER jenkins-slave