defmodule ChadevBot.Tableflip do
  @moduledoc """
  This plugin flips some tables.

  """
  use Butler.Plugin

  @usage """
  butler tableflip - replies with flipped tables.
  """
  respond ~r/tableflip/, conn do
    reply conn, "(╯°□°）╯︵ ┻━┻"
    reply conn, "(╯°□°）╯︵ <ǝlqɐʇ>"
    reply conn, "the table flipped you! ノ┬─┬ノ ︵ ( \o°o)\ "
    reply conn, "┻━┻ ︵ヽ(`Д´)ﾉ︵ ┻━┻"
  end
end
