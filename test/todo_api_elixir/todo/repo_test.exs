defmodule TodoApiElixir.Todo.RepoTest do
  use TodoApiElixir.DataCase

  alias TodoApiElixir.Todo.Repo

  describe "todos" do
    alias TodoApiElixir.Todo.Todo

    @valid_attrs %{done: true, name: "some name"}
    @update_attrs %{done: false, name: "some updated name"}
    @invalid_attrs %{done: nil, name: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Repo.create_todo()

      todo
    end

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Repo.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Repo.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      assert {:ok, %Todo{} = todo} = Repo.create_todo(@valid_attrs)
      assert todo.done == true
      assert todo.name == "some name"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Repo.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{} = todo} = Repo.update_todo(todo, @update_attrs)
      assert todo.done == false
      assert todo.name == "some updated name"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Repo.update_todo(todo, @invalid_attrs)
      assert todo == Repo.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Repo.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Repo.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Repo.change_todo(todo)
    end
  end
end
