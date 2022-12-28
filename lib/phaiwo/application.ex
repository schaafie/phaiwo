defmodule Phaiwo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhaiwoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Phaiwo.PubSub},
      # Start the Endpoint (http/https)
      PhaiwoWeb.Endpoint,
      # Registries for prey and predator
      {Registry, [keys: :unique, name: :pred_registry]},
      {Registry, [keys: :unique, name: :prey_registry]},
      # Start the World Supervisor 
      # Supervises prey and predator elements
      Phaiwo.WorldSupervisor,
      # Start the World Server
      { Phaiwo.WorldServer, %{ prey: 5, pred: 1} }
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phaiwo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhaiwoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
