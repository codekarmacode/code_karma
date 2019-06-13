defmodule CodeKarma.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :github_id, :integer, null: false
      add :username, :string, null: false
      add :avatar_url, :string, null: false
      add :github_url, :string, null: false

      timestamps()
    end

    create(unique_index(:users, :username))
    create(unique_index(:users, :github_id))
    create(unique_index(:users, :avatar_url))
    create(unique_index(:users, :github_url))
  end
end
