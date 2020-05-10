defmodule CodeKarmaWeb.SessionUserPlugTest do
  use CodeKarmaWeb.ConnCase

  test "init/1" do
    opts = %{}
    assert opts == CodeKarmaWeb.SessionUserPlug.init(opts)
  end

  describe "call/2" do
    test "Do nothing when the user is logged in", %{conn: conn} do
      conn = conn |> init_test_session(login: "github_user")

      response = CodeKarmaWeb.SessionUserPlug.call(conn, %{})

      assert response == conn
    end

    test "Redirect to the github authentication page when the user is not logged in", %{
      conn: conn
    } do
      conn = conn |> init_test_session(%{})

      assert get_session(conn, :user) == nil

      response = CodeKarmaWeb.SessionUserPlug.call(conn, %{})

      assert get_session(response, :user) == nil
      assert response.status == 302

      assert get_resp_header(response, "location") ==
               [CodeKarmaWeb.Router.Helpers.auth_path(conn, :request, :github)]

      assert String.contains?(response.resp_body, "redirected")
    end
  end
end
