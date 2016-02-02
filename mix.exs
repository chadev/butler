defmodule ChadevBot.Mixfile do
  use Mix.Project

  def project do
    [app: :chadev_bot,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      applications: [:logger, :butler]
    ]
  end

  def elixirc_paths(_), do: ["plugins"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:websocket_client, git: "http://github.com/jeremyong/websocket_client"},
      {:butler, "~> 0.7.1"},
      {:butler_cage, "~> 0.0.2"},
      {:butler_xkcd, git: "https://github.com/craiglyons/butler_xkcd"}
    ]
  end
end
