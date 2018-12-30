defmodule DiscordElixir.GatewaySocket do
    use WebSockex

    def start_link(url) do
        WebSockex.start_link(url, __MODULE__, %{parent: self()})
    end

    def send_payload(pid, payload) do
        WebSockex.send_frame(pid, {:text, Poison.encode!(payload)})
    end

    def close(pid) do
        monitor = Process.monitor(pid)
        send(pid, :close)
        receive do
            {:DOWN, ^monitor, :process, ^pid, reason} -> {:ok, :closed}
        end
    end

    def handle_frame({:text, msg}, %{parent: parent} = state) do
        send(parent, Poison.decode!(msg))
        {:ok, state}
    end

    def handle_info(:close, state) do
        {:close, state}
    end
end