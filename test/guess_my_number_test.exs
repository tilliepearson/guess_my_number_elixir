defmodule GuessMyNumberTest do
  use ExUnit.Case
  doctest GuessMyNumber

  test "greets the world" do
    assert GuessMyNumber.hello() == :world
  end
end
