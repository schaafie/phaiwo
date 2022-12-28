defmodule Phaiwo.Prey do
    use GenServer
  
    ## GenServer API
  
    def start_link(name) do
      GenServer.start_link(__MODULE__, name, name: via_tuple(name))
    end
    
    def get(process_name), do: process_name |> via_tuple() |> GenServer.call(:get)
    def action(process_name, action), do: process_name |> via_tuple() |> GenServer.cast({:do, action})
    def tick(process_name), do: process_name |> via_tuple() |> GenServer.cast(:tick)

    @doc """
    This function will be called by the supervisor to retrieve the specification 
    of the child process.The child process is configured to restart only if it 
    terminates abnormally.
    """
    def child_spec(process_name) do
      %{
        id: __MODULE__,
        start: {__MODULE__, :start_link, [process_name]},
        restart: :transient
      }
    end
  
    def stop(process_name, stop_reason) do
      # Given the :transient option in the child spec, the GenServer will restart
      # if any reason other than `:normal` is given.
      process_name |> via_tuple() |> GenServer.stop(stop_reason)
    end
  
    ## GenServer Callbacks
  
    @impl true
    def init(name) do
      state = %{ name: name }
      {:ok, state}
    end

    @impl true
    def handle_call(:get, _from, state) do
      {:reply, :ok, state}
    end

    @impl true
    def handle_cast(:tick, state) do
      {:noreply, state}
    end

    @impl true
    def handle_cast({:do, action}, state) do
      {:noreply, state}
    end
  
    ## Private Functions
    defp via_tuple(name), do: {:via, Registry, {:prey_registry, name}}
  end