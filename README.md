# Docker LEMP

- Nginx 1.20
- PHP 8.1
- MariaDB 10.6

## Setup

- Create and configure an *.env* file from *.env.dist*

- Add the below line to the hosts file

```
127.0.0.1  api.symfonyauctions.local
```

- Build containers:
  
```
make build
```

## Debug

### Debug async queues

Inside php container run

```
XDEBUG_TRIGGER=PHPSTORM PHP_IDE_CONFIG="serverName=api.symfonyauctions.local" php bin/console messenger:consume async -v
```

## Other versions

[PHP 7.4](https://github.com/rod86/symfonyauctions-docker/tree/php-7.4)