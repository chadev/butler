use Mix.Config

config :butler,
  name: System.get_env("BUTLER_NAME") || "butler",
  adapter: Butler.Adapters.Console,
  plugins: [
    {Butler.Plugins.Help, []},
    {ChadevBot.Cage, []},
    {ChadevBot.Chacam, []},
    {ChadevBot.Tableflip, []}
  ]

import_config "#{Mix.env}.exs"
