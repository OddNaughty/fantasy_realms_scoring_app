defmodule FantasyRealms.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FantasyRealmsWeb.Telemetry,
      # Start the Ecto repository
      FantasyRealms.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FantasyRealms.PubSub},
      # Start Finch
      {Finch, name: FantasyRealms.Finch},
      # Start the Endpoint (http/https)
      FantasyRealmsWeb.Endpoint
      # Start a worker by calling: FantasyRealms.Worker.start_link(arg)
      # {FantasyRealms.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FantasyRealms.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FantasyRealmsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
