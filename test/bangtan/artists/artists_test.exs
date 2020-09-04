defmodule Bangtan.ArtistsTest do
  use Bangtan.DataCase

  alias Bangtan.Artists

  @valid_attrs %{"name" => "Hello", "artist" => "Adele", "album" => "1"}
  @update_attrs %{"duration" => "4:40", "album" => "25"}
  @invalid_attrs %{"name" => nil, "artist" => "Adele", "album" => "1"}

  def song_fixture(attrs \\ %{}) do
    {:ok, song} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Artists.create_song()

    song
  end

  describe "songs" do
    test "list_songs/0 returns all songs" do
      song_fixture()
      assert length(Artists.list_songs()) > 0
    end

    test "get_song/1 returns the song with given id" do
      song = song_fixture()
      id = song.id
      %Artists.Song{id: ^id} = Artists.get_song(song.id)
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Artists.Song{} = song} = Artists.create_song(@valid_attrs)
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Artists.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()

      assert {:ok, %Artists.Song{}} = Artists.update_song(song, @update_attrs)
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      id = song.id
      assert {:error, %Ecto.Changeset{}} = Artists.update_song(song, @invalid_attrs)
      %Artists.Song{id: ^id} = Artists.get_song(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Artists.Song{}} = Artists.delete_song(song)
      assert is_nil(Artists.get_song(song.id))
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Artists.change_song(song)
    end
  end
end
