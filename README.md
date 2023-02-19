# Docker LEMP

- Nginx 1.20
- PHP 8.1
- MariaDB 10.6
- RabbitMQ
- MailHog

# Docs

- [Services](#services)
- [Start](#start)
- [Setup](#setup)
- [Debug](#debug)
- [Testing](#testing)
- [Other versions](#other-versions)
- [API Endpoints](#api-endpoints)

# Services

|   	        |   	                                |
|---	        |---	                                |
| API 	        | http://api.symfonyauctions.local  	|  
| RabbitMQ  	| http://api.symfonyauctions.local:15672  |
| MailHog       | http://api.symfonyauctions.local:8025   | 

Credentials are defined in ``.env`` file in this repository

# Start

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

- execute api requests on *http://api.symfonyauctions.local*


## Setup

- Create and configure an *.env* file from *.env.sample* in api.

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

# Debug

## Debug API requests

- Start listening on PHPStorm

- Send the query parameter ```XDEBUG_TRIGGER=PHPSTORM``` to debug request.

## Debug async queues

Inside php container run

```
XDEBUG_TRIGGER=PHPSTORM PHP_IDE_CONFIG="serverName=api.symfonyauctions.local" php bin/console messenger:consume async -v
```

# Testing

## Unit tests

Run unit tests with code coverage.
```
make test/unit
```

To see code coverage, open *coverage/index.html* 

## Feature tests

Run feature tests.
```
make test/feature
```

**NOTE** Some tests may fail due to fixtures are not reset. To rerun the features tests, you may need to reinstall fixtures.

## API Endpoints

[Symfony Auctions API Postman collection](./doc/symfony_auctions_api.postman_collection.json)


## Other versions

[PHP 7.4](https://github.com/rod86/symfonyauctions-docker/tree/php-7.4)