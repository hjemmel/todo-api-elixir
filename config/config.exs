# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todo_api_elixir,
  ecto_repos: [TodoApiElixir.Repo]

# Configures the endpoint
config :todo_api_elixir, TodoApiElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "82y6CPGqBh6Jn8zIlTKG3Txw+jO58YcF9rz1lFACfwcuSqZ5gAXWjimY1WqM6pBx",
  render_errors: [view: TodoApiElixirWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TodoApiElixir.PubSub,
  live_view: [signing_salt: "4WCk1vzA"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
