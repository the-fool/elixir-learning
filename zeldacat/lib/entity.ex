defmodule Entity do
  def init do
    GenEvent.start_link()
  end

  def add_component(pid, component, args) do
    GenEvent.add_handler(pid, component, args)  
  end
end
