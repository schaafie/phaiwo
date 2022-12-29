defmodule PhaiwoWeb.WorldController do
  use PhaiwoWeb, :controller

  alias Phaiwo.WorldServer

  def create(conn, params) do
    entities = WorldServer.create_world(params)
    render(conn, "index.json", entities: entities)
  end

  def get(conn, _params) do
    entities = WorldServer.get_world!()
    render(conn, "index.json", entities: entities)
  end

  def change(conn, args) do
    case args do
      %{"name" => name } ->
        IO.puts "Change by name"
      %{"x" =>  x, "y" => y} ->
        IO.puts "Change by location"
      _whatever ->
        IO.puts "Error"
    end

    conn |> json(%{error: "unknown"}) |> halt()
  end

end
