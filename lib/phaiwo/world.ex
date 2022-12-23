defmodule Phaiwo.World do
  use GenServer

  # Client

  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def get_world!() do
    GenServer.call()
  end

  # Server (callbacks)

  @impl true
  def init(_args) do
    stack = []
    {:ok, stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end

end