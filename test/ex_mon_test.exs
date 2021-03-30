defmodule ExMonTest do
  use ExUnit.Case

  alias ExMon.Player

  import ExUnit.CaptureIO

  describe "create_player/4" do
    test "returns a player" do
      expected_response = %Player{
        life: 100,
        moves: %{avg: :chute, heal: :cura, rnd: :soco},
        name: "Paulo"
      }

      assert expected_response == ExMon.create_player("Paulo", :chute, :soco, :cura)
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do
      player = Player.build("Paulo", :chute, :soco, :cura)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "The game is started"
    end
  end

  describe "make_move/1" do
    setup do
      player = Player.build("Paulo", :chute, :soco, :cura)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    test "when move is valid, do the move and the computer makes a move" do
      messages =
        capture_io(fn ->
          assert ExMon.make_move(:soco)
        end)

      assert messages =~ "It is the computer turn"
      assert messages =~ "It is the player turn"
    end

    test "when the move is invalid, returns error message" do
      messages =
        capture_io(fn ->
          assert ExMon.make_move(:wrong)
        end)

      assert messages =~ "wrong is an invalid move"
    end
  end
end
