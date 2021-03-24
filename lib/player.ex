defmodule ExMon.Player do
  @max_life 100
  @required_keys [:life, :name, :moves]

  @enforce_keys @required_keys
  defstruct @required_keys

  def build(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      life: @max_life,
      moves: %{
        avg: move_avg,
        heal: move_heal,
        rnd: move_rnd
      },
      name: name
    }
  end
end
