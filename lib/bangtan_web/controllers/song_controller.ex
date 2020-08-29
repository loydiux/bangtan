defmodule BangtanWeb.SongController do
  use BangtanWeb, :controller
  alias Bangtan.Artists

  @spec index(Plug.Conn.t(), Map.t()) :: Plug.Conn.t()
  def index(conn, _params) do
    songs = Artists.list_songs()
    render(conn, "index.html", songs: songs)
  end

  @spec new(Plug.Conn.t(), Map.t()) :: Plug.Conn.t()
  def new(conn, _params) do
    changeset = Artists.change_song(%Artists.Song{})
    render(conn, "new.html", changeset: changeset)
  end

  @spec create(Plug.Conn.t(), Map.t()) :: Plug.Conn.t()
  def create(conn, %{"song" => song_params}) do
    case Artists.create_song(song_params) do
      {:ok, song} ->
        conn
        |> put_flash(:info, "Song created successfully.")
        |> redirect(to: Routes.song_path(conn, :show, song))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  @spec show(Plug.Conn.t(), Map.t()) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    case Artists.get_song(id) do
      nil ->
        conn
        |> put_flash(:error, "Song doesn't exist #{id}")
        |> redirect(to: Routes.song_path(conn, :index))

      song ->
        render(conn, "show.html", song: song)
    end
  end

  @spec edit(Plug.Conn.t(), Map.t()) :: Plug.Conn.t()
  def edit(conn, %{"id" => id}) do
    song = Artists.get_song(id)
    changeset = Artists.change_song(song)
    render(conn, "edit.html", song: song, changeset: changeset)
  end

  @spec update(Plug.Conn.t(), Map.t()) :: Plug.Conn.t()
  def update(conn, %{"id" => id, "song" => song_params}) do
    song = Artists.get_song(id)

    case Artists.update_song(song, song_params) do
      {:ok, song} ->
        conn
        |> put_flash(:info, "Song updated successfully.")
        |> redirect(to: Routes.song_path(conn, :show, song))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", song: song, changeset: changeset)
    end
  end

  @spec delete(Plug.Conn.t(), Map.t()) :: Plug.Conn.t()
  def delete(conn, %{"id" => id}) do
    song = Artists.get_song(id)
    {:ok, _song} = Artists.delete_song(song)

    conn
    |> put_flash(:info, "Song deleted successfully.")
    |> redirect(to: Routes.song_path(conn, :index))
  end
end
