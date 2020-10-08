defmodule TodoApiElixirWeb.Router do
  use TodoApiElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    # plug CORSPlug, origin: "http://localhost:3000"
  end

  scope "/api", TodoApiElixirWeb do
    pipe_through :api

    resources "/todos", TodoController
  end
end
