defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("The game is #{info.status}")
  end

  def print_round_message(%{status: :continue, turn: player}) do
    IO.puts("It is the #{player} turn.")
  end

  def print_round_message(%{status: :game_over}) do
    IO.puts("The game is over")
  end

  @spec print_wrong_move_message(any) :: :ok
  def print_wrong_move_message(move) do
    IO.puts("#{move} is an invalid move")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("The player damaged computer in #{damage}!")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("The computer damaged player in #{damage}!")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("The #{player} healled itself to #{life} life points!")
  end
end
