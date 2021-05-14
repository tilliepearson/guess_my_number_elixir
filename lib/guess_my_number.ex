defmodule GuessMyNumber do
  @moduledoc """
    This is my very nice guess the number game
    call GuessMyNumber.new_game to play
  """
  alias GuessMyNumber.Game

  @doc """

  """
  def new_game do
    ask_for_number("Pick the max number for this game") |> Game.init() |> play()
  end

  @spec play(%Game{}) :: any
  defp play(state) do
    {state, guess_response} = Game.guess(state, ask_for_number("Enter a number"))

    case guess_response do
      :high ->
        IO.puts("That is too high :(")
        play(state)

      :low ->
        IO.puts("That is too low :o")
        play(state)

      :ok ->
        IO.puts("YOU GOT IT in #{Game.guesses(state)} guesses")
    end
  end

  defp ask_for_number(question) do
    IO.puts(question)
    IO.read(:stdio, :line) |> Integer.parse() |> elem(0)
  end
end
