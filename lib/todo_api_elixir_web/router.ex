defmodule TodoApiElixirWeb.Router do
  use TodoApiElixirWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {TodoApiElixirWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", TodoApiElixirWeb do
    pipe_through(:browser)

    # get("/", PageController, :home)
    get("/", ItemController, :index)

    get("/items/toggle/:id", ItemController, :toggle)
    get("/items/filter/:filter", ItemController, :index)
    get("/items/clear", ItemController, :clear_completed)
    resources("/items", ItemController, except: [:show])
  end

  # Other scopes may use custom stacks.
  # scope "/api", TodoApiElixirWeb do
  #   pipe_through :api
  # end
end
