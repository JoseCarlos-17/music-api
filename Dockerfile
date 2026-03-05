FROM ruby:3.1.2

# Diretório da app
WORKDIR /app

# Dependências do sistema
RUN apt-get update -qq && \
    apt-get install -y \
      build-essential \
      libpq-dev \
      nodejs \
      git

# Gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Código
COPY . .

# Porta padrão do Rails
EXPOSE 3000

# NÃO define production
# NÃO força HTTPS
# NÃO usa entrypoint
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
