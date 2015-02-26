# defenestrator/Laravel-BDD-CI
A starter kit for Laravel 5 BDD with support for Travis-CI 
[![Build Status](https://travis-ci.org/defenestrator/Laravel-BDD-CI.svg?branch=master)](https://travis-ci.org/defenestrator/Laravel-BDD-CI)
### How to build it
#### Either
- clone this repo

#### Or
Assuming you have a github account and a [Travis-CI](https://travis-ci.org) account linked to it:
- install Laravel ~5.0.1
- save a decent `.gitignore` file like 
[this one](https://gist.github.com/defenestrator/5ad679db122177888da5) to the root of your project

In terminal:
- `git init`
- `mv .env.example .env`
- `php artisan key:generate`
- `touch behat.yml .travis.yml .env.behat.travis`
- edit `composer.json` to add `"minimum-stability": "dev"` right before the closing brace

Additionally edit your `"require-dev":` to look like this:
```json
"require-dev": {
    "phpunit/phpunit": "~4.4.5",
    "phpspec/phpspec": "~2.1",
    "behat/behat": "~3.0@dev",
    "behat/mink": "~1.7@dev",
    "behat/mink-extension": "~2.0@dev",
    "laracasts/behat-laravel-extension": "dev-master#205a3d2",
    "laracasts/testdummy": "dev-master#44807c5"
  },
  ```

Again in terminal:    
- `composer install`
- `php artisan vendor:publish` - just in case
- `vendor/bin/behat --init`
- `git add .`

Then edit config/database.php so that:
- `'default' => 'mysql',` becomes `'default' => env('DB_TYPE', 'sqlite')`
- and `'database' => storage_path().'/database.sqlite',` says `'database' => storage_path(env('SQLITE_DB', 'database.sqlite')),`
- add `DB_TYPE=mysql` to `.env`
- `.env.behat` will be excluded from git, and you should add:

```
APP_ENV=acceptance
APP_DEBUG=true

DB_TYPE=sqlite
SQLITE_DB=acceptance.sqlite

CACHE_DRIVER=file
SESSION_DRIVER=file
```

- `.env.behat.travis` will be included in git, and should have identical contents to `.env.behat`

- add this to your behat.yml:

```yaml
default:
  extensions:
    Laracasts\Behat\ServiceContainer\BehatExtension: ~
    Behat\MinkExtension\ServiceContainer\MinkExtension:
      default_session: laravel
      laravel: ~
```

- Finally, edit .travis.yml to read:

```yaml
language: php
php:
  - 5.6
sudo: false

before_script:
  # setup mysql (to test production) , and sqlite (for behat acceptance)
  # update composer,
  # then grab the packages,
  # chmod storage
  # migrate and seed db
  - mv .env.behat.travis .env.behat
  - chmod -R 777 storage
  - touch storage/acceptance.sqlite
  - composer self-update
  - composer install --prefer-source
  - php artisan key:generate
  #- npm install - if you want to use gulp/elixir

script:
  # Run them tests, y'all
  #- gulp # if you are running 'npm install' in before_script
  - phpunit tests/
  - vendor/bin/phpspec run -v
  - vendor/bin/behat --config behat.yml
```

Back in terminal, run:
- `git remote add origin https://github.com/your-username/repo-name.git`
- `git commit -m "initial commit"`
- `git push -u origin master`

#### Go to [Travis-CI](https://travis-ci.org), synch your repositories, and turn this one on!


