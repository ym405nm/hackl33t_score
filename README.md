Score for Hackl33t Fighters II for WordPress
========================================

This is the score application for "Hackl33t Fighters II for WordPress
"

Please enjoy it with the score application. https://github.com/ym405nm/hackl33t_fighters


## Install

Git clone

Generate credentials. (https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336)

Docker Build

```bash
docker-compose build
docker-compose up
```

Build Assets Precompile

```bash
docker-compose exec web rake assets:clobber
```

```bash
docker-compose exec web rake assets:precompile RAILS_ENV=production
```

Migration

```bash
docker-compose exec web rake db:migrate
docker-compose exec web rake db:seed
```

## Future Works 

English Version...
