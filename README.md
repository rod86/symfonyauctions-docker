# Docker LEMP

- Nginx 1.20
- PHP 8.1
- MariaDB 10.6
- RabbitMQ
- MailHog

## Setup

- Create and configure an *.env* file from *.env.sample*

- Add the below line to the hosts file

```
127.0.0.1  api.symfonyauctions.local
```

- Build containers:
  
```
make build
```

## Services

|   	        |   	                                |
|---	        |---	                                |
| API 	        | http://api.symfonyauctions.local  	|  
| RabbitMQ  	| http://api.symfonyauctions.local:15672  |
| MailHog       | http://api.symfonyauctions.local:8025   | 

Credentials are defined in ``.env`` file in this repository


## Debug

### Debug async queues

Inside php container run

```
XDEBUG_TRIGGER=PHPSTORM PHP_IDE_CONFIG="serverName=api.symfonyauctions.local" php bin/console messenger:consume async -v
```

## Other versions

[PHP 7.4](https://github.com/rod86/symfonyauctions-docker/tree/php-7.4)