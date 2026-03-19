# Music-api

Um projeto simples que imita um pouco as plataformas famosas de música, como Spotify. Ele foi feito em:

* Ruby 3.0.0
* Rails 7.1.5
* Pg  1.3
* Devise 4.9
* Devise Token Auth 1.2

O projeto usa docker, então aqui estão os comandos para usar o projeto através dele:

#### Build das imagens:
docker compose build

#### Subir os containers:
docker compose up

#### Criar e preparar o banco de dados:
docker compose exec rails rails db:prepare

#### Acessar o console do rails:
docker compose exec rails rails c
