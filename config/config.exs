# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :phreak,
       PhreakWeb.Endpoint,
       url: [
         host: "localhost"
       ],
       secret_key_base: "xEGlzNEpRkNrKZiPnYzIP7UuELrn6he+G716tKFoRs8qM11MtgVYkxynmpfn6ozP",
       render_errors: [
         view: PhreakWeb.ErrorView,
         accepts: ~w(html json)
       ],
       pubsub: [
         name: Phreak.PubSub,
         adapter: Phoenix.PubSub.PG2
       ],
       live_view: [
         signing_salt: "SECRET_SALT"
       ],
       pubsub: [
         name: Phreak.PubSub,
         adapter: Phoenix.PubSub.PG2
       ]

# Configures Elixir's Logger
config :logger,
       :console,
       format: "$time $metadata[$level] $message\n",
       metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phreak,
       :kube,
       config: "/Users/dmitrii.dimandt/.kube/config"

# Refresh kube once every 15 seconds
config :phreak,
       Phreak.Scheduler,
       jobs: [
         refresh_kube: [
           schedule: {:extended, "*/15"},
           task: fn -> Phreak.Kube.refresh() end
         ]
       ],
       debug_logging: false

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
