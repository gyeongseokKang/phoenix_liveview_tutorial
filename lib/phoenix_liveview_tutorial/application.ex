defmodule PhoenixLiveviewTutorial.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixLiveviewTutorialWeb.Telemetry,
      # Start the Ecto repository
      PhoenixLiveviewTutorial.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixLiveviewTutorial.PubSub},
      # Start Finch
      {Finch, name: PhoenixLiveviewTutorial.Finch},
      # Start the Endpoint (http/https)
      PhoenixLiveviewTutorialWeb.Endpoint
      # Start a worker by calling: PhoenixLiveviewTutorial.Worker.start_link(arg)
      # {PhoenixLiveviewTutorial.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixLiveviewTutorial.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixLiveviewTutorialWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
