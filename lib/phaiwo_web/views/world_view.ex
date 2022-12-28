defmodule PhaiwoWeb.WorldView do
  use PhaiwoWeb, :view
  alias PhaiwoWeb.WorldView

  def render("index.json", %{entities: entities}) do
    entities
    # Enum.map(entities, fn(x) -> render("element.json", x) end)
  end

  def render("element.json", %{name: name, x: x, s: s, y: y, orientation: o}) do
    %{ name: name, x: x, y: y, s: s, o: o }
  end
end
