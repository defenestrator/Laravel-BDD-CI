# defenestrator/Laravel-BDD-CI
A starter kit for Laravel 5 BDD with support for Travis-CI 
### How to build it
#### Either
- clone this repo
#### Or
- install Laravel ~5.0.1
- save a decent `.gitignore` file like 
(https://gist.github.com/defenestrator/5ad679db122177888da5)[this one] to the root of your project
In terminal:
- `git init`
- `mv .env.example .env`
- `php artisan key:generate`
- `touch behat.yml .travis.yml .env.behat.travis`
- `git add .`
- edit `composer.json` to change `"minimum-stability":` to `"dev"`
And your `"require-dev":` should look like this:
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

Again in terminal    
- `composer install`
- `php artisan vendor:publish`
- edit config/database.php so 
  - `'default' => 'mysql',` 
    - says `'default' => env('DB_TYPE', 'sqlite')`
  - and `'database' => storage_path().'/database.sqlite',`
    - becomes `'database' => storage_path(env('SQLITE_DB', 'database.sqlite')),`
- add `DB_TYPE=mysql` to `.env`