use Mix.Config

config :butler,
  name: System.get_env("BUTLER_NAME") || "butler",
  adapter: Butler.Adapters.Console,
  plugins: [
    {ChadevBot.Example, []}
  ]

import_config "#{Mix.env}.exs"
