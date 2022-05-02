defmodule Req.IntegrationTest do
  use ExUnit.Case

  @moduletag :integration

  setup do
    original_gl = Process.group_leader()
    {:ok, capture_gl} = StringIO.open("")
    Process.group_leader(self(), capture_gl)

    on_exit(fn ->
      Process.group_leader(self(), original_gl)
    end)
  end

  doctest Req,
    only: [
      get!: 2,
      post!: 2,
      put!: 2,
      patch!: 2,
      delete!: 2
    ]

  doctest Req.Steps,
    only: [
      auth: 1,
      put_default_user_agent: 1,
      compressed: 1,
      put_base_url: 1,
      encode_body: 1,
      put_params: 1,
      put_range: 1,
      put_if_modified_since: 1,
      decompress: 1,
      decode_body: 1
    ]
end
