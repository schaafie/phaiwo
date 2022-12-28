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

end
