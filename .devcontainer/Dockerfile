FROM mcr.microsoft.com/devcontainers/php:8.3

RUN mkdir -p /home/vscode/project
WORKDIR /home/vscode/project

# Install additional PHP extensions and dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y libzip-dev libsodium-dev \
       libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql zip pcntl sodium gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Laravel installer globally
USER vscode
RUN composer global require laravel/installer
USER root

# Create alias for sail
RUN echo "alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'" >> /home/vscode/.zshrc
RUN echo "alias s='sail'" >> /home/vscode/.zshrc
RUN echo "alias sa='sail artisan'" >> /home/vscode/.zshrc
RUN echo "alias sat='sail artisan test'" >> /home/vscode/.zshrc
RUN echo 'export PATH="/workspaces/project/vendor/bin/:$PATH"' >> /home/vscode/.zshrc

# Add Composer global bin directory to PATH
RUN echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> /home/vscode/.zshrc
RUN echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> /home/vscode/.bashrc

# Define the location of the npm cache. This is needed because permission problems
# will occur if the cache is stored in the default location (/root/tmp/.npm)
RUN echo 'export npm_config_cache=/home/vscode/tmp/npm-cache' >> /home/vscode/.zshrc

RUN git clone https://github.com/zsh-users/zsh-completions.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-completions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-autosuggestions.git /home/vscode/.oh-my-zsh/custom/plugins/zsh-autosuggestions

RUN cp /home/vscode/.zshrc /home/vscode/.zshrc.bak

RUN echo "$(cat /home/vscode/.zshrc)" | awk '{gsub(/plugins=\(git\)/, "plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions)")}1' > /home/vscode/.zshrc.replaced && mv /home/vscode/.zshrc.replaced /home/vscode/.zshrc


RUN curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
  | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
  && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
  | sudo tee /etc/apt/sources.list.d/ngrok.list \
  && sudo apt update \
  && sudo apt install ngrok

# Install PostgreSQL client
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y postgresql-client \
    && apt-get install -y python3-pip


# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Now install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

RUN chown -R vscode:vscode /home/vscode/project
RUN chmod -R 700 /home/vscode/project

# Fix ownership of vscode home directory files
RUN chown -R vscode:vscode /home/vscode
