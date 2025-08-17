# Laravel Sail Setup

## Why This Step
Laravel Sail provides a Docker-based development environment that ensures consistency across different development machines. It eliminates the need to install PHP, database servers, and other dependencies locally, making setup faster and more reliable.

## What It Does
- Installs Laravel Sail as a development dependency
- Configures Docker containers for the application with PostgreSQL and Redis
- Sets up the development environment with proper networking and volume mounting
- Enables running Laravel artisan commands through the Sail wrapper

## Implementation

### Install Laravel Sail Package
```bash
composer require laravel/sail --dev
```

### Configure Sail with PostgreSQL and Redis
```bash
php artisan sail:install --with=pgsql,redis
```

### Start the Development Environment
```bash
sail up
```

### Install NPM Dependencies
Once Sail is running, install the frontend dependencies:
```bash
sail npm install
```

### Run Database Migrations
Set up the database structure:
```bash
sail artisan migrate
```

### Start Frontend Development Server
Start the Vite development server for hot reloading:
```bash
sail npm run dev
```