defmodule ElixirAppWeb.AboutPage do
  use ElixirAppWeb, :live_view

  def mount(_params, _session, socket) do
    temperature = 70 # Let's assume a fixed temperature for now
    {:ok, assign(socket, :temperature, temperature)}
  end

end
