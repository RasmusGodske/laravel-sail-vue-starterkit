# Debug Configuration

## Why This Step
Setting up Xdebug enables step-by-step debugging of PHP code directly in VSCode. This is essential for development as it allows you to set breakpoints, inspect variables, and trace code execution within the Docker containers.

## What It Does
- Configures Xdebug within the Laravel Sail Docker containers
- Sets up VSCode to connect to the Xdebug server running in Docker
- Establishes proper path mappings between the container and local filesystem
- Enables debugging, tracing, and code coverage capabilities

## Implementation

### Add Xdebug Configuration to Environment Files
Add Xdebug settings to both `.env` and `.env.example`:

```bash
# Update .env file
echo "SAIL_XDEBUG_CONFIG=\"client_host=host.docker.internal client_port=9003 start_with_request=default idekey=VSCODE\"" >> .env
echo "SAIL_XDEBUG_MODE=\"develop,debug,trace,coverage\"" >> .env

# Update .env.example file
echo "SAIL_XDEBUG_CONFIG=\"client_host=host.docker.internal client_port=9003 start_with_request=default idekey=VSCODE\"" >> .env.example
echo "SAIL_XDEBUG_MODE=\"develop,debug,trace,coverage\"" >> .env.example
```

### Create VSCode Launch Configuration
Create `.vscode/launch.json` with the following content:

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
              "/var/www/html": "${workspaceFolder}"
          }
      }
  ]
}
```

The path mapping is crucial as it tells Xdebug that files located at `/var/www/html` inside the Docker container correspond to files in your VSCode workspace folder.