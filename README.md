# Docker - Jenkins - BuildAgent - PHP + Node.js

This Docker image enables running builds for applications in a PHP and Node.js environment.

## Features

*   Customize the PHP version (minor, e.g. 7.2, 7.1) by building your own image.

    Utilizes packages from [deb.sury.org](https://deb.sury.org/).

*   Customize the Node.js version (major, e.g. 11.x, 10.x) by building your own image.

    Utilizes official packages from [nodejs.org](https://nodejs.org/en/download/package-manager/).

## Included Software

*   [PHP](http://www.php.net/)

    *   [Composer](https://getcomposer.org/)

*   [Node.js](https://nodejs.org/)

    *   [NPM](https://www.npmjs.com/)
    *   [Yarn](https://yarnpkg.com/)

*   [Apache Ant](https://ant.apache.org/)

    *   [Ant-Contrib Tasks](http://ant-contrib.sourceforge.net/)

*   [rsync](https://rsync.samba.org/)

## License

This repository is released under the [MIT license](LICENSE).

## Authors

*   picodexter | [GitHub](https://github.com/picodexter) | [picodexter.io](https://picodexter.io/)

See also the [list of contributors](https://github.com/picodexter/docker-jenkins-buildagent-php-nodejs/contributors).

## Contributing

The official project repository with the issue tracker can be found
[on GitHub](https://github.com/picodexter/docker-jenkins-buildagent-php-nodejs).
