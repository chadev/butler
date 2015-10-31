defmodule ChadevBot.Example do
  use Butler.Plugin

  respond ~r/example me/, conn do
    reply conn, "some other thing"
    reply conn, "This is just an example response"
  end
end
