# defenestrator/Laravel-BDD-CI
A starter kit for Laravel 5 BDD with support for Travis-CI 
### How to build it
#### Either
- clone this repo
#### Or
- install Laravel ~5.0.1
- edit "require-dev" in composer.json:
```json
"require-dev": {
    "phpunit/phpunit": "~4.4.5",
    "phpspec/phpspec": "~2.1",
    "behat/behat": "~3.0@dev",
    "behat/mink": "~1.7@dev",
    "behat/mink-extension": "~2.0@dev",
    "laracasts/behat-laravel-extension": "dev-master#205a3d2",
    "laracasts/testdummy": "dev-master#44807c5",
    "barryvdh/laravel-ide-helper": "dev-master#1f5e436",
    "doctrine/dbal": "~2.6@dev",
    "fzaninotto/faker": "~1.4"
  },
  ```  
- run `composer install`
- edit config/database.php so 
  - `'default' => 'mysql',` 
    - says `'default' => env('DB_TYPE', 'sqlite')`
  - and `'database' => storage_path().'/database.sqlite',`
    - becomes `'database' => storage_path(env('SQLITE_DB', 'database.sqlite')),`
