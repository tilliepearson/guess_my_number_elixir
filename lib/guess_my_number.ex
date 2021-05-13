defmodule GuessMyNumber do
  @moduledoc """
   This is my very nice guess the number game
    call GuessMyNumber.new_game to play
  """
  alias GuessMyNumber.Game

  def new_game do
   ask_for_number("Pick the max number for this game (1 - X)") |> Game.init() |> play()
  end

  @spec play(%Game{}) :: any
  defp play(state) do
    guess = ask_for_number("Enter a number")
    state = Game.increment_guesses(state)

    cond do
      Game.check_guess(state, guess) == :high ->
        IO.puts("That is too high :(")
        play(state)

      Game.check_guess(state, guess) == :low ->
        IO.puts("That is too low :o")
        play(state)

      Game.check_guess(state, guess) == :ok ->
        IO.puts("YOU GOT IT in #{Game.guesses(state)} guesses")
    end
  end

  defp ask_for_number(question) do
    IO.puts(question)
    IO.read(:stdio, :line) |> Integer.parse() |> elem(0)
  end
end
