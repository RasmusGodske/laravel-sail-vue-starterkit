# Setup Guide

This guide provides step-by-step instructions for recreating this Laravel starter kit. Each step is documented in detail to explain why it's necessary and how to implement it.

## Overview

This Laravel starter kit includes:
- **Vue 3** with Inertia.js for modern frontend development
- **Laravel Sail** for Docker-based development environment
- **TypeScript** integration with automatic type generation
- **Code quality tools** including Pint formatting and Git hooks
- **IDE enhancements** for better developer experience

## Setup Steps

Follow these steps in order to recreate the starter kit:

1. **[Laravel Installation](01-laravel-installation.md)** - Install Laravel CLI and create the base project
2. **[Laravel Sail Setup](02-laravel-sail-setup.md)** - Configure Docker development environment
3. **[Debug Configuration](03-debug-configuration.md)** - Set up Xdebug for VSCode
4. **[Code Formatting](04-code-formatting.md)** - Configure Pint for PHP formatting
5. **[Laravel Data Package](05-laravel-data.md)** - Install Spatie Laravel Data for DTOs
6. **[TypeScript Transformer](06-typescript-transformer.md)** - Set up automatic type generation
7. **[Git Hooks](07-git-hooks.md)** - Configure Husky for pre-commit quality checks
8. **[IDE Helper](08-ide-helper.md)** - Install Laravel IDE Helper for autocompletion
9. **[Development Workflow](09-development-workflow.md)** - Create Composer scripts for common tasks
10. **[Type Inertia Shared Data](10-type-inertia-shared-data.md)** - Implement type-safe shared data for Inertia.js
11. **[Install Laravel Debugbar](11-install-laravel-debugbar.md)** - Add debugging tools for development

## Quick Start

Once you've followed all the setup steps, you can start development with:

```bash
# Start the development environment
sail up

# Install dependencies and set up the project
sail composer dev-setup

# Start the frontend development server
sail npm run dev
```

## Notes

- Each step builds upon the previous ones, so follow them in order
- Some steps require manual configuration that cannot be automated
- The documentation explains the reasoning behind each choice to help with future maintenance

