# NOTE: This class is auto generated by the swagger code generator program.
# https://github.com/swagger-api/swagger-codegen.git
# Do not edit the class manually.

defmodule FlipsideDatabridgeAPI.Api.Default do
  @moduledoc """
  API calls for all endpoints tagged `Default`.
  """

  alias FlipsideDatabridgeAPI.Connection
  import FlipsideDatabridgeAPI.RequestBuilder

  @doc """
  Get Active Records
  The \&quot;get active records\&quot; endpoint returns a list of records that are currently being processed by your consumer(s).

  ## Parameters

  - connection (FlipsideDatabridgeAPI.Connection): Connection to server
  - api_key (String.t):
  - opts (KeywordList): [optional] Optional parameters

  ## Returns

  {:ok, [%ActiveRecord{}, ...]} on success
  {:error, info} on failure
  """
  @spec get_jobs(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, list(FlipsideDatabridgeAPI.Model.ActiveRecord.t())} | {:error, Tesla.Env.t()}
  def get_jobs(connection, api_key, _opts \\ []) do
    %{}
    |> method(:get)
    |> url("/records/active")
    |> add_param(:query, :api_key, api_key)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode([%FlipsideDatabridgeAPI.Model.ActiveRecord{}])
  end

  @doc """
  Get the Next Record
  The \&quot;get next record\&quot; endpoint returns the next available record to consume in a specified topic.

  ## Parameters

  - connection (FlipsideDatabridgeAPI.Connection): Connection to server
  - topic_slug (String.t):
  - consumer_id (String.t):
  - api_key (String.t):
  - opts (KeywordList): [optional] Optional parameters

  ## Returns

  {:ok, %FlipsideDatabridgeAPI.Model.Record{}} on success
  {:error, info} on failure
  """
  @spec get_next_record(Tesla.Env.client(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, FlipsideDatabridgeAPI.Model.Record.t()} | {:error, Tesla.Env.t()}
  def get_next_record(connection, topic_slug, consumer_id, api_key, _opts \\ []) do
    %{}
    |> method(:get)
    |> url("/topics/#{topic_slug}/records/next")
    |> add_param(:query, :consumer_id, consumer_id)
    |> add_param(:query, :api_key, api_key)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode(%FlipsideDatabridgeAPI.Model.Record{})
  end

  @doc """
  Get Available Topics
  The topics endpoint returns a list of topics that the api key is publishing to or consuming from.

  ## Parameters

  - connection (FlipsideDatabridgeAPI.Connection): Connection to server
  - api_key (String.t):
  - opts (KeywordList): [optional] Optional parameters

  ## Returns

  {:ok, [%Topic{}, ...]} on success
  {:error, info} on failure
  """
  @spec get_topics(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, list(FlipsideDatabridgeAPI.Model.Topic.t())} | {:error, Tesla.Env.t()}
  def get_topics(connection, api_key, _opts \\ []) do
    %{}
    |> method(:get)
    |> url("/topics")
    |> add_param(:query, :api_key, api_key)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode([%FlipsideDatabridgeAPI.Model.Topic{}])
  end

  @doc """
  Count Unread Records
  The \&quot;count unread records\&quot; endpoint returns a number of the unread records for that topic.

  ## Parameters

  - connection (FlipsideDatabridgeAPI.Connection): Connection to server
  - api_key (String.t):
  - topic_slug (String.t):
  - opts (KeywordList): [optional] Optional parameters

  ## Returns

  {:ok, %FlipsideDatabridgeAPI.Model.Metadata{}} on success
  {:error, info} on failure
  """
  @spec get_unread_records(Tesla.Env.client(), String.t(), String.t(), keyword()) ::
          {:ok, FlipsideDatabridgeAPI.Model.Metadata.t()} | {:error, Tesla.Env.t()}
  def get_unread_records(connection, api_key, topic_slug, _opts \\ []) do
    %{}
    |> method(:get)
    |> url("/topics/#{topic_slug}")
    |> add_param(:query, :api_key, api_key)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode(%FlipsideDatabridgeAPI.Model.Metadata{})
  end

  @doc """
  Publish a Record
  The \&quot;publish record\&quot; endpoint allows you to publish a record to a specified topic.

  ## Parameters

  - connection (FlipsideDatabridgeAPI.Connection): Connection to server
  - body (NewRecordRequest):
  - topic_slug (String.t):
  - api_key (String.t):
  - opts (KeywordList): [optional] Optional parameters

  ## Returns

  {:ok, %FlipsideDatabridgeAPI.Model.NewRecord{}} on success
  {:error, info} on failure
  """
  @spec publish_record(
          Tesla.Env.client(),
          FlipsideDatabridgeAPI.Model.NewRecordRequest.t(),
          String.t(),
          String.t(),
          keyword()
        ) :: {:ok, FlipsideDatabridgeAPI.Model.NewRecord.t()} | {:error, Tesla.Env.t()}
  def publish_record(connection, body, topic_slug, api_key, _opts \\ []) do
    %{}
    |> method(:post)
    |> url("/topics/#{topic_slug}/records")
    |> add_param(:body, :body, body)
    |> add_param(:query, :api_key, api_key)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode(%FlipsideDatabridgeAPI.Model.NewRecord{})
  end

  @doc """
  Register a Consumer
  Register a consumer with the Data Bridge to use when consuming topic-level records.  Save the \&quot;consumer id\&quot; that is returned to identify future requests.

  ## Parameters

  - connection (FlipsideDatabridgeAPI.Connection): Connection to server
  - api_key (String.t):
  - opts (KeywordList): [optional] Optional parameters

  ## Returns

  {:ok, %FlipsideDatabridgeAPI.Model.Consumer{}} on success
  {:error, info} on failure
  """
  @spec register_consumer(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, FlipsideDatabridgeAPI.Model.Consumer.t()} | {:error, Tesla.Env.t()}
  def register_consumer(connection, api_key, _opts \\ []) do
    %{}
    |> method(:post)
    |> url("/consumers")
    |> add_param(:body, :body, %{})
    |> add_param(:query, :api_key, api_key)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode(%FlipsideDatabridgeAPI.Model.Consumer{})
  end

  @doc """
  Update Record State
  The \&quot;update record state\&quot; endpoint is used by consumers to indicate to the Data Bridge whether a record has been successfully processed.  A record can be set to one of two states, *\&quot;completed\&quot;* or *\&quot;failed\&quot;*.  *\&quot;Completed\&quot;* indicates to the Data Bridge that you have processed the record and would like to update your place in the topic to the next available record.  *\&quot;Failed\&quot;* indicates that you have failed to process the record. The record will be re-assigned. If subsequent re-assignments continue to result in failures, the record will be skipped after a maximum of 5 retries.

  ## Parameters

  - connection (FlipsideDatabridgeAPI.Connection): Connection to server
  - record_id (String.t): The id of the record to be updated.
  - state (String.t): The state of the record to be updated.
  - api_key (String.t):
  - opts (KeywordList): [optional] Optional parameters

  ## Returns

  {:ok, %FlipsideDatabridgeAPI.Model.UpdatedRecordState{}} on success
  {:error, info} on failure
  """
  @spec update_record_state(Tesla.Env.client(), String.t(), String.t(), String.t(), keyword()) ::
          {:ok, FlipsideDatabridgeAPI.Model.UpdatedRecordState.t()} | {:error, Tesla.Env.t()}
  def update_record_state(connection, record_id, state, api_key, _opts \\ []) do
    %{}
    |> method(:put)
    |> url("/records/#{record_id}/state/#{state}")
    |> add_param(:query, :api_key, api_key)
    |> Enum.into([])
    |> (&Connection.request(connection, &1)).()
    |> decode(%FlipsideDatabridgeAPI.Model.UpdatedRecordState{})
  end
end