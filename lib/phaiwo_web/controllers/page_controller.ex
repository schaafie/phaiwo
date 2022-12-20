defmodule PhaiwoWeb.PageController do
  use PhaiwoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
