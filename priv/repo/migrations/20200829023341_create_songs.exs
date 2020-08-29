defmodule Bangtan.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :name, :string
      add :artist, :string
      add :album, :string
      add :mv, :string
      add :duration, :string
      add :release_date, :date

      timestamps()
    end

    create unique_index(:songs, [:artist, :name], name: :songs_index)
  end
end
