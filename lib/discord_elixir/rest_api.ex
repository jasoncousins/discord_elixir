defmodule DiscordElixir.RestAPI do

    alias DiscordElixir.RestAPI.HTTP

    def get(url) do
        HTTP.get(url)
    end

    def get(url, token) do
        HTTP.get(url, ["Authorization": "Bot " <> token])
    end

    defmodule HTTP do
        use HTTPoison.Base
        
        @base_url "https://discordapp.com/api"

        @impl true
        def process_request_url(path) do
            @base_url <> path
        end

        @impl true
        def process_request_headers(headers) do
            headers ++ ["Accept": "application/json"]
        end

        @impl true
        def process_request_body(body) do
            Poison.encode!(body)
        end

        @impl true
        def process_response_body(body) do
            Poison.decode!(body)
        end
    end
end