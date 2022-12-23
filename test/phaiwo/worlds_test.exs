defmodule Phaiwo.WorldsTest do
  use Phaiwo.DataCase

  alias Phaiwo.Worlds

  describe "worlds" do
    alias Phaiwo.Worlds.World

    import Phaiwo.WorldsFixtures

    @invalid_attrs %{}

    test "list_worlds/0 returns all worlds" do
      world = world_fixture()
      assert Worlds.list_worlds() == [world]
    end

    test "get_world!/1 returns the world with given id" do
      world = world_fixture()
      assert Worlds.get_world!(world.id) == world
    end

    test "create_world/1 with valid data creates a world" do
      valid_attrs = %{}

      assert {:ok, %World{} = world} = Worlds.create_world(valid_attrs)
    end

    test "create_world/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Worlds.create_world(@invalid_attrs)
    end

    test "update_world/2 with valid data updates the world" do
      world = world_fixture()
      update_attrs = %{}

      assert {:ok, %World{} = world} = Worlds.update_world(world, update_attrs)
    end

    test "update_world/2 with invalid data returns error changeset" do
      world = world_fixture()
      assert {:error, %Ecto.Changeset{}} = Worlds.update_world(world, @invalid_attrs)
      assert world == Worlds.get_world!(world.id)
    end

    test "delete_world/1 deletes the world" do
      world = world_fixture()
      assert {:ok, %World{}} = Worlds.delete_world(world)
      assert_raise Ecto.NoResultsError, fn -> Worlds.get_world!(world.id) end
    end

    test "change_world/1 returns a world changeset" do
      world = world_fixture()
      assert %Ecto.Changeset{} = Worlds.change_world(world)
    end
  end
end
