defmodule Bangtan.Artists.Song do
  use Ecto.Schema
  import Ecto.Changeset

  schema "songs" do
    field :artist, :string
    field :album, :string
    field :name, :string
    field :duration, :string
    field :release_date, :date
    field :mv, :string

    timestamps()
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:name, :artist, :album, :mv, :duration, :release_date])
    |> validate_required([:name, :artist, :album])
    |> unique_constraint(:songs_constraint, name: :songs_index)
  end
end
