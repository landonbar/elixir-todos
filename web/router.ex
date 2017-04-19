defmodule Todos.Router do
  use Todos.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    #plug :accepts, ["json"]
  end

  scope "/", Todos do
    IO.puts "/"
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Add this scope for handling API requests
  scope "/api", Todos do
    #IO.puts "api"
    pipe_through :api

    resources "/todos", TodoController, only: [:index]
   # get "/todos", TodoController, only: [:index]
   # post "/todos", TodoController, only: [:index]

  end

  # Other scopes may use custom stacks.
  # scope "/api", Todos do
  #   pipe_through :api
  # end
end
