defmodule TodoApiElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TodoApiElixirWeb.Telemetry,
      TodoApiElixir.Repo,
      {DNSCluster, query: Application.get_env(:todo_api_elixir, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TodoApiElixir.PubSub},
      # Start a worker by calling: TodoApiElixir.Worker.start_link(arg)
      # {TodoApiElixir.Worker, arg},
      # Start to serve requests, typically the last entry
      TodoApiElixirWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TodoApiElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TodoApiElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
