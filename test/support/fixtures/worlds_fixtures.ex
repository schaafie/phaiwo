defmodule Phaiwo.WorldsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Phaiwo.Worlds` context.
  """

  @doc """
  Generate a world.
  """
  def world_fixture(attrs \\ %{}) do
    {:ok, world} =
      attrs
      |> Enum.into(%{

      })
      |> Phaiwo.Worlds.create_world()

    world
  end
end
