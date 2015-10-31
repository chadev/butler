defmodule ChadevBot.Cage do
  use Butler.Plugin

  @url "http://cageme.herokuapp.com"

  respond ~r/cageme/, conn do
    :random.seed(:os.timestamp)
    random = :random.uniform(80)
    reply conn, "#{@url}/specific/#{random}.jpeg"
  end
end
