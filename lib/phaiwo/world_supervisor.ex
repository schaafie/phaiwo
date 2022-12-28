defmodule Phaiwo.WorldSupervisor do
    @moduledoc """
    This supervisor is responsible game child processes.
    """
    use DynamicSupervisor
  
    def start_link(_arg) do
        DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
    end
  
    def start_child(type,name) do
        child_specification = case type do
            "prey" ->
                { Phaiwo.Prey, name }
            "pred" ->
                { Phaiwo.Pred, name }
        end

        DynamicSupervisor.start_child(__MODULE__, child_specification)
    end
  
    @impl true
    def init(_arg) do
        # :one_for_one strategy: if a child process crashes, only that process is restarted.
        DynamicSupervisor.init(strategy: :one_for_one)
    end
end