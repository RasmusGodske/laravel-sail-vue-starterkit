# Setup

Below are the stepts that has been used to set up this project, for future reference. 


# Recreation Steps
The steps ran to create this project.

## Instal laravel CLI tool

```bash
composer global require laravel/installer
```

## Creating using Vue StarterKit

```bash
laravel new new-app --vue --phpunit
```

NOTE: Select "no" to npm install

## Moving files to root directory

```bash
# Move files from vendor directory
mv ./new-app/vendor/* ./vendor/
rm -r ./new-app/vendor

# Move the rest
cp -r ./new-app/. ./ && rm -rf ./new-app
```


## Install Laravel Sail

Install Laravel Sail composer package
```bash
composer require laravel/sail --dev
```

```bash
php artisan sail:install --with=pgsql,redis
```

## Add debug support
We need to add debug support by adding:
`SAIL_XDEBUG_CONFIG=client_host=host.docker.internal client_port=9003 start_with_request=default idekey=VSCODE` to the env

```bash
echo "SAIL_XDEBUG_CONFIG=\"client_host=host.docker.internal client_port=9003 start_with_request=default idekey=VSCODE\"" >> .env

echo "SAIL_XDEBUG_CONFIG=\"client_host=host.docker.internal client_port=9003 start_with_request=default idekey=VSCODE\"" >> .env


echo "SAIL_XDEBUG_MODE=\"develop,debug,trace,coverage\"" >> .env
echo "SAIL_XDEBUG_MODE=\"develop,debug,trace,coverage\"" >> .env.example
```

## Add launch.json
Add the following to `.vscode/launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
      {
          "name": "🪲 Listen for Xdebug",
          "type": "php",
          "request": "launch",
          "log":false,
          "port": 9003,
          "pathMappings": {
              // The path where the project files are mounted within the containers running xdebug.
              // we need to tell xdebug that the files are located in a different path
              // than within the vscode workspace
              "/var/www/html": "${workspaceFolder}"
          }
      }
  ]
}
```


## Start Sail
Start the Sail environment with the following command:
```bash
sail up
```

## Install NPM dependencies
Install the NPM dependencies by running:
```bash
sail npm install
``` 

## run migrations
Run the migrations to set up the database:
```bash
sail artisan migrate
```

## Run node install
Run the node install to set up the frontend:
```bash
sail npm run dev
```

## Configuring Pint

pint.json
```json
{
  "preset": "laravel",
  "rules": {
    "array_syntax": { "syntax": "short" },
    "ordered_imports": true,
    "single_quote": true
  }
}
```

Add the following to your `composer.json` file under the `scripts` section:
```json
"scripts": {
  "format:php": "pint", 
  "format:php-dirty": "pint --dirty",
}
```


## Install Husky
Install Husky to manage Git hooks:
```bash
npm install --save-dev husky
npx husky init
```

Create the following hooks:

.husky/pre-commit
```bash
#!/bin/sh
echo "📋 Running pre-commit checks..."

# Run formatter on dirty files
./vendor/bin/sail composer format:php-dirty

# Check if the formatting created unstaged changes
if [ -n "$(git diff --name-only)" ]; then
  echo "❌ Code formatting fixed issues but the changes aren't staged."
  echo "Please review the formatting changes with 'git diff', then stage them with 'git add -u' and try committing again."
  exit 1
fi

echo "✅ Pre-commit checks passed!"
```

.husky/pre-commit
```bash
#!/usr/bin/env sh
# Check for PSR compliance before committing

echo "📋 Running pre-commit checks..."

# Run the command, saving output to a file while displaying it
./vendor/bin/sail composer dump-autoload --dry-run -o --strict-psr 2>&1 | tee /tmp/composer_output.txt
STATUS=$?

# Check if we have PSR compliance errors
if grep -q "does not comply with psr-4 autoloading standard" /tmp/composer_output.txt; then
  echo ""
  echo "❌ PSR-4 compliance error detected! Please fix the file paths to match PSR-4 autoloading."
  echo "❌ Commit aborted."
  exit 1
elif [ $STATUS -ne 0 ]; then
  echo ""
  echo "❌ Error detected in autoload generation. Commit aborted."
  exit 1
else
  echo "✅ PSR compliance check passed!"
fi

# Clean up
rm -f /tmp/composer_output.txt
```


