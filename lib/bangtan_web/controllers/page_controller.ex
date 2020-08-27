defmodule BangtanWeb.PageController do
  use BangtanWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
