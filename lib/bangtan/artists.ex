defmodule Bangtan.Artists do
  import Ecto.Query, warn: false
  alias Bangtan.{Artists, Repo}

  @doc """
  Returns the list of songs.

  ## Examples

      iex> list_songs()
      [%Artists.Song{...}, ...]

  """
  @spec list_songs :: [Artists.Song.t()]
  def list_songs() do
    Artists.Song
    |> order_by(asc: :id)
    |> Repo.all()
  end

  @doc """
  Given an id, returns a song or nil.

  ## Examples

      iex> get_song(1)
      %Artists.Song{...}

      iex> get_song(100000)
      nil

  """
  @spec get_song(Integer.t()) :: Artists.Song.t() | nil
  def get_song(id) do
    Artists.Song
    |> Repo.get(id)
  end

  @doc """
  Creates a song.

  ## Examples

      iex> create_song(%{name: value})
      {:ok, %Artists.Song{...}}

      iex> create_song(%{name: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec create_song(Map.t()) :: {:ok, Artists.Song.t()} | {:error, Ecto.Changeset.t()}
  def create_song(attrs \\ %{}) do
    %Artists.Song{}
    |> Artists.Song.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a song.

  ## Examples

      iex> update_song(song, %{name: new_value})
      {:ok, %Artists.Song{...}}

      iex> update_accupdate_songount(song, %{name: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  @spec update_song(Artists.Song.t(), Map.t()) ::
          {:ok, Artists.Song.t()} | {:error, Ecto.Changeset.t()}

  def update_song(%Artists.Song{} = song, attrs) do
    song
    |> Artists.Song.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Song.

  ## Examples

      iex> delete_account(song)
      {:ok, %Artists.Song{...}}

      iex> delete_account(song)
      {:error, %Ecto.Changeset{}}

  """
  @spec delete_song(Artists.Song.t()) ::
          {:ok, Artists.Song.t()} | {:error, Ecto.Changeset.t()}
  def delete_song(%Artists.Song{} = song) do
    Repo.delete(song)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking song changes.

  ## Examples

      iex> change_song(song)
      %Ecto.Changeset{source: %Accounts.Account{}}

  """
  def change_song(%Artists.Song{} = song) do
    Artists.Song.changeset(song, %{})
  end
end
