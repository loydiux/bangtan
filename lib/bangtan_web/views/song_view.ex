defmodule BangtanWeb.SongView do
  use Timex
  use BangtanWeb, :view

  def convert_embed(link) do
    "#{String.replace(link, "watch?v=", "embed/")}?autoplay=1"
  end

  def format_date(date) do
    {:ok, format} = Timex.format(date, "{D}-{0M}-{YYYY}")
    format
  end
end
