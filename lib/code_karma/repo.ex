defmodule CodeKarma.Repo do
  use Ecto.Repo,
    otp_app: :code_karma,
    adapter: Ecto.Adapters.Postgres
end
