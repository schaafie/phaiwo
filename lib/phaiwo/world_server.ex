defmodule Phaiwo.WorldServer do
  use GenServer

  # Client

  def start_link(arg) do
    GenServer.start_link(__MODULE__, arg, name: WorldServer)
  end

  def get_world!() do
    GenServer.call( WorldServer, :get)
  end

  def create_world(args) do
    GenServer.call( WorldServer, { :create, args})
  end

  def get_details!(name) do
    GenServer.call( WorldServer, {:get, name})
  end

  def left(name) do 
    GenServer.cast( WorldServer, {:do, name, "left"} )
  end

  def right(name) do 
    GenServer.cast( WorldServer, {:do, name, "right"} )
  end

  def move(name) do 
    GenServer.cast( WorldServer, {:do, name, "move"} )
  end

  # Server (callbacks)

  @impl true
  def init(_args) do
    {:ok, []}
  end

  @impl true
  def handle_call({:create, args}, _from, _state) do
    %{"h" => h, "w" => w, "prey" => preynum, "pred" => prednum} = args
    preystack = Enum.map( 1..preynum, fn x -> create_prey(w,h,x) end)
    predstack = Enum.map( 1..prednum, fn x -> create_pred(w,h,x) end)
    new_state = preystack ++ predstack
    {:reply, new_state, new_state }
  end

  @impl true
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call({:get, elementname}, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:do, elementname, action}, state) do
    {:noreply, state}
  end

  # Server private functions
  defp create_pred w, h, num do
    name = "pred_" <> Integer.to_string( num )
    Phaiwo.WorldSupervisor.start_child "pred", name
    %{ 
      name: name,
      x: :rand.uniform(w-100)+50, 
      y: :rand.uniform(h-100)+50,
      s: 10,
      c: "red",
      o: :rand.uniform(359)
    }
  end

  defp create_prey w, h, num do
    name = "prey_" <> Integer.to_string( num )
    Phaiwo.WorldSupervisor.start_child "prey", name
    %{ 
      name: name,
      x: :rand.uniform(w-100)+50, 
      y: :rand.uniform(h-100)+50, 
      s: 10,
      c: "blue",
      o: :rand.uniform(359)
    }
  end

end