# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule FlipsideDatabridgeAPI.Model.Record do
  @moduledoc """

  """

  @derive [Poison.Encoder]
  defstruct [
    :id,
    :data
  ]

  @type t :: %__MODULE__{
          :id => String.t(),
          :data => %{}
        }
end

defimpl Poison.Decoder, for: FlipsideDatabridgeAPI.Model.Record do
  import FlipsideDatabridgeAPI.Deserializer

  def decode(value, options) do
    value
  end
end
