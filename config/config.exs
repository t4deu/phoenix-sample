# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :showme,
  ecto_repos: [Showme.Repo]

# Configures the endpoint
config :showme, Showme.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "otrnWjpxdnJlX6+FqHQZNV5FaUGrut3Bx6SV9iLLB+dJT2EvJ/aoUCtZNhBhuvWT",
  render_errors: [view: Showme.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Showme.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
