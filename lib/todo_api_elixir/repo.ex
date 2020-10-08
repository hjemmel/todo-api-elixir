defmodule TodoApiElixir.Repo do
  use Ecto.Repo,
    otp_app: :todo_api_elixir,
    adapter: Ecto.Adapters.Postgres
end
