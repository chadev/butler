defmodule ChadevBot.Tableflip do
  @moduledoc """
  This plugin flips some tables.

  """
  use Butler.Plugin

  @usage """
  butler tableflip - replies with flipped tables.
  """

  def flip_table do
    :random.seed(:os.timestamp)
    table_list = [
        "(╯°□°）╯︵ ┻━┻",
        "(╯°□°）╯︵ <ǝlqɐʇ>",
        "the table flipped you! ノ┬─┬ノ ︵ ( \o°o)\ ",
        "┻━┻ ︵ヽ(`Д´)ﾉ︵ ┻━┻"
      ]

    Enum.random(table_list)
  end

  respond ~r/tableflip/, conn do
    reply conn, flip_table
  end
end
