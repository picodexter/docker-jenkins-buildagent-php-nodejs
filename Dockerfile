FROM jenkins

ARG PHP_VERSION=7.2

ARG NODE_JS_BRANCH=9.x

USER root

RUN echo "Updating APT cache ..." \
    && apt-get update -q > /dev/null \

    && echo "PHP: Setting up repository packages.sury.org ..." \
    && apt-get install -qy --no-install-recommends apt-transport-https lsb-release ca-certificates > /dev/null \
    && wget -qO /etc/apt/trusted.gpg.d/packages-sury-org.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \
    && echo "PHP: Updating APT cache ..." \
    && apt-get update -q > /dev/null \
    && echo "PHP: Installing PHP packages ..." \
    && apt-get install -qy --no-install-recommends \
        php${PHP_VERSION} \
        php${PHP_VERSION}-fpm \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-gd \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-mysql \
        php${PHP_VERSION}-xdebug \
        php${PHP_VERSION}-xml \
        > /dev/null \

    && echo "PHP: Installing Composer ..." \
    && wget -qO- https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer --quiet \

    && echo "Node.js: Setting up repository deb.nodesource.com ..." \
    && curl -sL https://deb.nodesource.com/setup_${NODE_JS_BRANCH} | bash - > /dev/null \
    && echo "Node.js: Installing Node.js packages ..." \
    && apt-get install -qy --no-install-recommends nodejs build-essential > /dev/null \

    && echo "All done!"

USER jenkins
