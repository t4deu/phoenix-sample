defmodule Showme.Router do
  use Showme.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Showme.Auth, repo: Showme.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Showme do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources  "/sessions", SessionController, only: [:new, :create, :delete]
  end

  scope "/manage", Showme do
    pipe_through [:browser, :authenticate_user]

    resources "/videos", VideoController
  end
end
