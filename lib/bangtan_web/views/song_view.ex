defmodule BangtanWeb.SongView do
  use BangtanWeb, :view

  def convert_embed(link) do
    "#{String.replace(link, "watch?v=", "embed/")}?autoplay=1"
  end
end
