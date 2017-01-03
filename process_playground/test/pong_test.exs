defmodule PongTest do
  use ExUnit.Case

  test "it responds to a ping with a pong" do
    pong = spawn_link(Pong, :start, [])
    send(pong, {:pong, self})
    assert_receive {:ping, pong}
  end

  test "it responds to 2 pings with 2 pongs" do
    pong = spawn_link(Pong, :start, [])
    send(pong, {:pong, self})
    assert_receive {:ping, pong}
    send(pong, {:pong, self})
    assert_receive {:ping, pong}
  end
end
