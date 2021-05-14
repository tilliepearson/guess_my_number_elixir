defmodule GuessMyNumber.Game do
  defstruct number: 0, guesses: 0

  def init(number) do
    %GuessMyNumber.Game{number: Enum.random(1..number), guesses: 0}
  end

  def check_guess(state, guess) when guess > state.number, do: :high
  def check_guess(state, guess) when guess < state.number, do: :low
  def check_guess(_state, _guess), do: :ok

  def guess(state, guess) do
    {%{state | guesses: state.guesses + 1}, check_guess(state, guess)}
  end

  def guesses(state) do
    state.guesses
  end

end
