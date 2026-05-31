# Ambiente de usuário — subtarefas

Contexto: API pública de catálogo (leitura). O admin continua em `/internal`. Autenticação do usuário fica fora deste escopo por enquanto.

---

**US-01 — Listar artistas**

Como usuário, quero ver uma lista de artistas para escolher quem explorar no catálogo.

Implementar `GET /artists` com `ArtistsController#index`, serializer de listagem (`id`, `name`, `country`, `profile_photo`) e teste de request. Endpoint público, sem autenticação.

---

**US-02 — Visualizar artista**

Como usuário, quero abrir o detalhe de um artista e ver suas músicas associadas.

Implementar `GET /artists/:id` com `ArtistsController#show` e serializer de detalhe. Incluir as músicas do artista via associação (`artist_songs` / `songs`). Teste de request cobrindo status 200 e presença dos dados do artista e das músicas.

---

**US-03 — Listar músicas**

Como usuário, quero ver uma lista de músicas para navegar pelo catálogo.

Adicionar rota `resources :songs, only: %i[index show]`. Implementar `SongsController#index` com serializer de listagem (`id`, `title`, `duration`, `release_date`, `file_url` e artistas resumidos, se fizer sentido na listagem). Teste de request para `GET /songs`.

---

**US-04 — Visualizar música**

Como usuário, quero abrir o detalhe de uma música e ver quais artistas participam dela.

Implementar `GET /songs/:id` com `SongsController#show` e serializer de detalhe. Incluir os artistas associados via `artist_songs` / `artists`. Teste de request cobrindo status 200 e presença dos dados da música e dos artistas.
