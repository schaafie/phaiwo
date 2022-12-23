defmodule PhaiwoWeb.WorldController do
  use PhaiwoWeb, :controller

  alias Phaiwo.World
  
  def index(conn, _params) do
    worlds = World.list_worlds()
    render(conn, "index.json", worlds: worlds)
  end

end
