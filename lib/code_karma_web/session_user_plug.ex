defmodule CodeKarmaWeb.SessionUserPlug do
  import Plug.Conn

  @moduledoc """
  When a user is not logged in, the end user will be redirected to the home page.
  """
  @behaviour Plug

  def init(opts), do: opts

  # When there is a login in the session, the conn is not modified.
  # When there is no login in the session, the conn redirects to the home page.
  @spec call(Plug.Conn.t(), map) :: Plug.Conn.t()
  def call(conn, _) do
    case get_session(conn, :login) do
      nil ->
        Phoenix.Controller.redirect(conn,
          to: CodeKarmaWeb.Router.Helpers.auth_path(conn, :request, :github)
        )
        |> halt()

      _ ->
        conn
    end
  end
end
