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

    hd(Enum.take_random(table_list, 1))
  end

  respond ~r/tableflip/, conn do
    reply conn, flip_table
  end
end
