defmodule ListServerTest do
  use ExUnit.Case

  setup do
    ListServer.start_link
    ListServer.clear
  end

  test "it starts empty" do
    assert ListServer.items == []
  end

  test "it lets us add things" do
    ListServer.add "thing"
    assert ListServer.items == ["thing"]
  end

  test "it remove things" do
    ListServer.add "thing 1"
    ListServer.add "thing 2"
    ListServer.remove "thing 1"
    assert ListServer.items == ["thing 2"]
  end
end
