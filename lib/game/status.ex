defmodule ExMon.Game.Status do
  alias ExMon.Game

  def print_round_message() do
    game_info = Game.info()

    IO.puts("The game is #{game_info.status}")
  end

  def print_wrong_move_message(move) do
    IO.puts("#{move} is an invalid move")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("The player damaged computer in #{damage}!")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("The computer damaged player in #{damage}!")
  end
end
