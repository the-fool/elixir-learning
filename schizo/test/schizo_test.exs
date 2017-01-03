defmodule SchizoTest do
  use ExUnit.Case
  doctest Schizo

  test "uppercase doesn't change first" do
    assert(Schizo.uppercase("foo") == "foo")
  end

  test "uppercase converts the second word" do
    assert(Schizo.uppercase("foo bar") == "foo BAR")
  end

  test "converts every other word" do
    assert(Schizo.uppercase("foo bar baz bux") == "foo BAR baz BUX") 
  end
end
