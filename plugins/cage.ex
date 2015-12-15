defmodule ChadevBot.Cage do
  @moduledoc """
  Generates urls for cageme.herokuapp.com
  """
  use Butler.Plugin

  @url "http://cageme.herokuapp.com"

  @usage """
  #{name} cageme - replies with a hillarious picture of Nick Cage.
  """
  respond ~r/cageme/, conn do
    :random.seed(:os.timestamp)
    random = :random.uniform(80)
    reply conn, "#{@url}/specific/#{random}.jpeg"
  end
end

