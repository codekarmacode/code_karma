defmodule CodeKarmaWeb.AuthController do
  use CodeKarmaWeb, :controller
  plug(Ueberauth)

  def callback(conn, _params) do
    conn
    |> extract_user_info_from_conn()
    |> build_response(conn)
  end

  defp extract_user_info_from_conn(conn) do
    with {:ok, assigns} <- Map.fetch(conn, :assigns),
         {:ok, auth} <- Map.fetch(assigns, :ueberauth_auth),
         {:ok, extra} <- Map.fetch(auth, :extra),
         {:ok, raw_info} <- Map.fetch(extra, :raw_info),
         {:ok, user_info} <- Map.fetch(raw_info, :user),
         filtered_user_info = %{"login" => _login, "name" => _name, "avatar_url" => _avatar_url} <-
           Map.take(user_info, ["login", "name", "avatar_url"]) do
      {:ok, filtered_user_info}
    else
      _ -> :error
    end
  end

  defp build_response({:ok, user_info}, conn) do
    user_info
    |> Enum.reduce(conn, fn {key, val}, conn -> put_session(conn, key, val) end)
    |> redirect(to: "/")
  end

  defp build_response(:error, conn) do
    send_resp(conn, 301, "You are not authorized")
  end
end
