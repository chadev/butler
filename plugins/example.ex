defmodule ChadevBot.Example do
  @moduledoc """
  Example plugin module.

  This doesn't do anything particularly useful. It just demonstrates how
  plugins work.
  """
  use Butler.Plugin

  @usage """
  butler example me - replies with some example text
  """
  respond ~r/example me/, conn do
    reply conn, "some other thing"
    reply conn, "This is just an example response"
  end
end
