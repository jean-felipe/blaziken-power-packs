defmodule BlazikenPowerPacksWeb.Router do
  use BlazikenPowerPacksWeb, :router

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

  scope "/", BlazikenPowerPacksWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/items", ItemController
    resources "/packages", PackageController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlazikenPowerPacksWeb do
  #   pipe_through :api
  # end
end
