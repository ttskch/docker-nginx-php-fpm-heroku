# Applying to Symfony4 project

## Expected directory structure

```diff
  $ tree -L 2 .
  .
+ ├── Dockerfile
  ├── bin
  ├── composer.json
  ├── composer.lock
  ├── config
+ ├── docker
+ │   ├── nginx.conf
+ │   └── php.ini
  ├── public
  ├── src
  ├── symfony.lock
  ├── var
  └── vendor
```
