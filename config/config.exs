# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :code_karma,
  ecto_repos: [CodeKarma.Repo]

# Configures the endpoint
config :code_karma, CodeKarmaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qBDrtUCuKaKYIMDovjgMGemEvK0gGBtfnmNsZZOVzzEpfSvFibD3Xy7pTj/OKrRP",
  render_errors: [view: CodeKarmaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CodeKarma.PubSub,
  live_view: [signing_salt: "7s9hqZT8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.

config :ueberauth, Ueberauth,
  providers: [
    github: {Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
  client_id: System.get_env("GITHUB_CLIENT_ID"),
  client_secret: System.get_env("GITHUB_CLIENT_SECRET")

import_config "#{Mix.env()}.exs"
