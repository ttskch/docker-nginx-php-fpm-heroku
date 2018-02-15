# nginx-php-fpm-heroku

Minimal image of Nginx + PHP-FPM running on Alpine.

With this image 👏 **you can deploy your PHP project to Heroku via [Container Registry](https://devcenter.heroku.com/articles/container-registry-and-runtime)** 👏 because layer count and image size are decreased as much as possible to meet [Heroku's restriction](https://devcenter.heroku.com/articles/container-registry-and-runtime#known-issues-and-limitations).

## Usage

### 1. Add Dockerfile into your PHP project

> This is just an example. It's of course ready for Composer.

```bash
$ cd /path/to/your-php-project
$ tree .
.
├── index.php
└── Dockerfile

0 directories, 3 files
```

```php
<?php
// index.php
echo 'Hello, Heroku Container Registry!';
```

```
# Dockerfile
FROM ttskch/nginx-php-fpm-heroku

# as will be described later, just for local development
UESR nonroot
```

### 2. Deploy to Heroku

```bash
$ heroku login
$ heroku container:login
$ heroku create {appname}
$ heroku container:push web
$ heroku open
```

Then you can see `'Hello, Heroku Container Registry!'` on https://{appname}.herokuapp.com

## Local development

Of course you can run your app locally on this image too.

```bash
$ docker build . -t {sometag}
$ docker run -p {port}:8888 -v $(pwd):/docroot {sometag}
```

Or

```bash
$ heroku container:push web
$ docker run -p {port}:8888 -v $(pwd):/docroot registry.heroku.com/{appname}/web
```

Then browse http://localhost:{port}

## More examples

See [examples](examples).

## What's special?

* Less number of layers
* Small image size
* Nginx correctly listens to $PORT which set by Herkou web dyno on runtime
* [As Heroku recommends](https://devcenter.heroku.com/articles/container-registry-and-runtime#run-the-image-as-a-non-root-user), can run as non-root user locally (Many permission problems are solved)

## Getting involved

Feel free to send Pull Request for

* Fixing bug or enhancement
* Adding some [examples](examples)
