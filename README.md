# Docker LEMP

- Nginx 1.20
- PHP 7.4
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
