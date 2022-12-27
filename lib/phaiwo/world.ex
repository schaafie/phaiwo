defmodule Phaiwo.World do
  use GenServer

  # Client

  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: WorldServer)
  end

  def get_world!() do
    GenServer.call( WorldServer, :get)
  end

  def get_details!(name) do
    GenServer.call( WorldServer, {:get, name})
  end

  def left() do 
    GenServer.cast( WorldServer, {:do, name, "left"} )
  end

  def right() do 
    GenServer.cast( WorldServer, {:do, name, "right"} )
  end

  def move() do 
    GenServer.cast( WorldServer, {:do, name, "move"} )
  end

  # Server (callbacks)

  @impl true
  def init(_args) do
    stack = []
    {:ok, stack}
  end

  @impl true
  def handle_call(:get, _from, state) do
    {:reply, state}
  end

  @impl true
  def handle_call({:get, elementname}, _from, state) do
    {:reply, state}
  end

  @impl true
  def handle_cast({:do, elementname, action}, state) do
    {:noreply, state}
  end

end