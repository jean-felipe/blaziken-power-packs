# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :blaziken_power_packs,
  ecto_repos: [BlazikenPowerPacks.Repo]

# Configures the endpoint
config :blaziken_power_packs, BlazikenPowerPacksWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "j6R2Bervi95ndoBjstjfjr0bslGYRWM3AxccykXvgy2d7eNMAArN5GrR79yrTTv6",
  render_errors: [view: BlazikenPowerPacksWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BlazikenPowerPacks.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
