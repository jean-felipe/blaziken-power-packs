defmodule BlazikenPowerPacks.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :price, :decimal
      add :description, :string
      add :supplier_id, :integer
      add :status, :integer
      add :item_type, :integer
      add :image_url, :string

      timestamps()
    end

  end
end
