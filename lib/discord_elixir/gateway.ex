defmodule DiscordElixir.Gateway do
  use GenServer

  # Client API


  ## GenServer callbacks

  @impl true
  def init(state) do
    {:ok, state}
  end

end
