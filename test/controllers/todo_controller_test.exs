# Create this test in test/controllers/todo_controller_test.exs
defmodule Todos.TodoControllerTest do
  use Todos.ConnCase
  import Todos.Factory

  test "#index renders a list of todos" do
    conn = build_conn()
    todo = insert(:todo)

    conn = get conn, todo_path(conn, :index)

    assert json_response(conn, 200) == %{
      "todos" => [%{
        "title" => todo.title,
        "description" => todo.description,
        "inserted_at" => NaiveDateTime.to_iso8601(todo.inserted_at),
        "updated_at" => NaiveDateTime.to_iso8601(todo.updated_at)
      }]
    }
  end
end