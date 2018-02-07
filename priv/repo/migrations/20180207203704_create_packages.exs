defmodule BlazikenPowerPacks.Repo.Migrations.CreatePackages do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :name, :string
      add :price, :decimal
      add :description, :string
      add :image_url, :string
      add :days, :integer
      add :status, :integer

      timestamps()
    end

  end
end
