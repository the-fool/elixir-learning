defmodule CliTest do
  use ExUnit.Case

  import Issues.CLI, only: [ parse_args: 1 ]

  test "passing -h and --help options returns help" do
    assert parse_args(["-h", "___"]) == :help
    assert parse_args(["--help", "___"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "count is default if two values given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end
end
