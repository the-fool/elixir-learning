defmodule HealthComponent do
  use GenEvent

  def init(hp) do
    {:ok, hp}
  end

  def handle_call(:get_hp, hp) do
    {:ok, hp, hp}
  end

  def get_hp(entity) do
    GenEvent.call(entity, HealthComponent, :get_hp)
  end

  def alive?(entity) do
    GenEvent.call(entity, HealthComponent, :alive?)
  end

  def handle_call(:alive?, hp) do
      {:ok, hp > 0, hp}
  end

end
