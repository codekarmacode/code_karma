# CodeKarma

To start your Phoenix server:

  * Configure an OAuth application in your [developper settings](https://github.com/settings/developers).
  ```
  Application name: CodeKarma
  Homepage URL: http://www.codekarma.localhost:4000
  Authorization callback URL: http://www.codekarma.localhost:4000/auth/github/callback
  ```
  Store the `client_id` and the `client_secret` to env variables `GITHUB_CLIENT_ID` and `GITHUB_CLIENT_SECRET`
  * If needed add in your `/etc/hosts` file the entry `127.0.0.1 www.codekarma.localhost`
  * Setup the project with `mix setup`
  * Start Phoenix endpoint with `mix phx.server`
