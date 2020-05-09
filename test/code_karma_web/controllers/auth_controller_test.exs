defmodule CodeKarma.AuthControllerTest do
  use CodeKarmaWeb.ConnCase

  describe "callback/2" do
    test "accept github user", %{conn: conn} do
      github_user_info = %{
        "avatar_url" => "https://avatars0.githubusercontent.com/u/702505?v=4",
        "login" => "martymcfly",
        "name" => "Marty McFly"
      }

      conn =
        conn
        |> init_test_session(%{})
        |> assign(:ueberauth_auth, %{
          extra: %{raw_info: %{user: github_user_info}}
        })

      response = get(conn, "auth/github/callback", nil)

      assert response.status == 302
      assert response.resp_body =~ "redirected"
      assert get_session(response) == github_user_info
    end

    test "reject non authorized user" do
      conn =
        build_conn()
        |> init_test_session(%{})
        |> assign(:ueberauth_auth, %{})

      response = get(conn, "auth/github/callback", nil)

      assert response.status == 301
      assert response.resp_body == "You are not authorized"
      assert get_session(response) == %{}
    end
  end
end
