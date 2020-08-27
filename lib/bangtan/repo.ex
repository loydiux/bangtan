defmodule Bangtan.Repo do
  use Ecto.Repo,
    otp_app: :bangtan,
    adapter: Ecto.Adapters.Postgres,
    show_sensitive_data_on_connection_error: true

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    case Application.get_env(:bangtan, :env) do
      :prod ->
        opts =
          opts
          |> Keyword.put(
            :url,
            System.get_env("DATABASE_URL") <>
              "?pool_size=" <> (System.get_env("POOL_SIZE") || "10")
          )

        {:ok, opts}

      _ ->
        {:ok, opts}
    end
  end
end
