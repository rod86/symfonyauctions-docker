# Docker LEMP

- Nginx 1.20
- PHP 8.1
- MariaDB 10.6
- RabbitMQ
- MailHog

## Setup

- Create and configure an *.env* file from *.env.sample*.

- Add the hostname to the hosts file.
```
127.0.0.1  api.symfonyauctions.local
```

- Build containers. 
```
make build
```

- Start containers.
```
make up
```

- Install dependencies.
```
make install
```

- Setup database (create database, run migrations and load fixtures).
```
make database
```

## Start

- Start docker containers
```
make up
```

- Clear queues messages (if any).
```
make queues/clear
```

- Start queues
```
make queues/listen
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

## Testing

### Unit tests

Run unit tests with code coverage.
```
make test/unit
```
To see code coverage, open *coverage/index.html* 

### Feature tests

Run feature tests.
```
make test/feature
```

**NOTE** Some tests may fail due to fixtures are not reset. To rerun the features tests, you may need to reinstall fixtures.

## Other versions

[PHP 7.4](https://github.com/rod86/symfonyauctions-docker/tree/php-7.4)