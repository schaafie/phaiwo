defmodule PhaiwoWeb.Router do
  use PhaiwoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PhaiwoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhaiwoWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", PhaiwoWeb do
    pipe_through :api

    post "/", WorldController, :create
    get "/", WorldController, :get
    get "/details/:name", WorldController, :get_details
    put "/details/:name", WorldController, :change

  end

end
