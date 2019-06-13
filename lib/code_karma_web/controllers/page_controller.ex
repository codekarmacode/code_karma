defmodule CodeKarmaWeb.PageController do
  use CodeKarmaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
