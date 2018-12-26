defmodule DiscordElixir.Gateway.Payload do
  # Gateway Opcodes
  # https://discordapp.com/developers/docs/topics/opcodes-and-status-codes#gateway
  @opcode_dispatch 0
  @opcode_heartbeat 1
  @opcode_identify 2
  @opcode_status_update 3
  @opcode_voice_state_update 4
  @opcode_resume 6
  @opcode_reconnect 7
  @opcode_request_guild_members 8
  @opcode_invalid_session 9
  @opcode_hello 10
  @opcode_heartbeat_ack 11
end
