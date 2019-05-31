defmodule PhreakWeb.Router do
  use PhreakWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhreakWeb do
    pipe_through :browser

    get "/", IndexController, :index
    live "/books", BooksLive
    live "/kube", KubeLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhreakWeb do
  #   pipe_through :api
  # end
end