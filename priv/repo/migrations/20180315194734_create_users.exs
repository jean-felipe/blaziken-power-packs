defmodule BlazikenPowerPacks.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false
      add :email, :string, null: false
      add :phone, :string
      add :password_hash, :string
      add :gender, :integer
      add :status, :integer
      add :street, :string
      add :street_number, :integer
      add :zipcode, :string
      add :city, :string
      add :state, :integer
      add :neighborhood, :string
      add :cpf, :string

      timestamps()
    end

  end
end
