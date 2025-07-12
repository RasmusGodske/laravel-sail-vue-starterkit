# Laravel Boilerplate

This is a boilerplate that sets up a Laravel Project with Vue 3, InertiaJs, Tailwind CSS, Laravel Sail and Devcontainer.

It is designed to be used with the [Laravel CLI tool](https://laravel.com/docs/10.x/installation#installing-the-laravel-cli-tool).

# Features
- **Vue 3**: Modern JavaScript framework for building user interfaces.
- **Inertia.js**: Allows you to create single-page apps using classic server-side routing
- **Tailwind CSS**: Utility-first CSS framework for rapid UI development.
- **Laravel Sail**: Provides a Docker development environment for Laravel applications.
- **Devcontainer**: Pre-configured development environment for Visual Studio Code.

# Getting Started
The easiest way to create a new project using this boilerplate is to use the Official Laravel CLI tool `laravel/installer`.


## Method 1: Installing the Laravel CLI tool globally in your system
This method requires you to have the Laravel CLI tool installed globally on your system. 

Requires:
- PHP
- Composer

To install the Laravel CLI tool globally, run the following command:
```bash
composer global require laravel/installer
```

Once you have the Laravel CLI tool installed, you can create a new project using the following command:
```bash
APP_NAME=new-app

laravel new $APP_NAME --using=rasmusgodske/laravel-sail-vue-starterkit
```

## Method 2: Using Laravel Cli tool docker wrapper
If you prefer not to install the Laravel CLI tool globally, you can use the [docker-laravel-cli](https://github.com/RasmusGodske/docker-laravel-cli) which provides a Docker wrapper for the Laravel CLI tool. This allows you to run the Laravel CLI commands without installing it globally on your system.


```bash
APP_NAME=new-app

docker run -it --rm -v $(pwd):/workspace -e USER_ID=$(id -u) -e GROUP_ID=$(id -g) godske/docker-laravel-cli:latest laravel new $APP_NAME --using=rasmusgodske/laravel-sail-vue-starterkit
```





