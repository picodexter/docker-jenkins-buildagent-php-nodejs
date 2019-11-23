FROM jenkins/jenkins

ARG PHP_VERSION=7.3

ARG NODE_JS_BRANCH=13.x

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
        php${PHP_VERSION}-zip \
        > /dev/null \
    && echo "PHP: Installing Composer ..." \
    && wget -qO- https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer --quiet \
    && echo "Node.js: Setting up repository deb.nodesource.com ..." \
    && curl -sL https://deb.nodesource.com/setup_${NODE_JS_BRANCH} | bash - > /dev/null \
    && echo "Node.js: Installing Node.js packages ..." \
    && apt-get install -qy --no-install-recommends nodejs build-essential > /dev/null \
    && echo "Yarn: Setting up repository dl.yarnpkg.com ..." \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && sh -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list' \
    && echo "Yarn: Updating APT cache ..." \
    && apt-get update -q > /dev/null \
    && echo "Yarn: Installing Yarn ..." \
    && apt-get install -qy --no-install-recommends yarn > /dev/null \
    && echo "webpack: Installing webpack packages ..." \
    && apt-get install -qy --no-install-recommends libpng-dev > /dev/null \
    && echo "Ant: Installing Ant ..." \
    && apt-get install -qy --no-install-recommends ant ant-contrib ant-optional libjsch-java > /dev/null \
    && echo "rsync: Installing rsync ..." \
    && apt-get install -qy --no-install-recommends rsync > /dev/null \
    && echo "Cleaning up APT cache ..." \
    && rm -rf /var/lib/apt/lists/* \
    && echo "All done!"

USER jenkins
