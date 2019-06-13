defmodule CodeKarma.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    field :avatar_url, :string
    field :github_id, :integer
    field :github_url, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:github_id, :username, :avatar_url, :github_url])
    |> validate_required([:github_id, :username, :avatar_url, :github_url])
  end
end
