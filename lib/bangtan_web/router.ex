defmodule BangtanWeb.Router do
  use BangtanWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BangtanWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/songs", SongController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BangtanWeb do
  #   pipe_through :api
  # end
end
