Hackl33t Fighters for WordPress
==========

## Install

Git clone

Copy `master.key` file

```bash
ls config/master.key
```

Docker Build

```bash
docker-compose build
docker-compose up
```

Build Assets Precompile

```bash
docker-compose exec web rake assets:precompile RAILS_ENV=production
```

Migration

```bash
docker-compose exec web rake db:migrate
docker-compose exec web rake db:seed
```
