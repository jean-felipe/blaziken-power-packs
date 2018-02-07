defmodule BlazikenPowerPacks.Packs.Package do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlazikenPowerPacks.Packs.Package


  schema "packages" do
    field :days, :integer
    field :description, :string
    field :image_url, :string
    field :name, :string
    field :price, :decimal
    field :status, :integer

    timestamps()
  end

  @doc false
  def changeset(%Package{} = package, attrs) do
    package
    |> cast(attrs, [:name, :price, :description, :image_url, :days, :status])
    |> validate_required([:name, :price, :description, :image_url, :days, :status])
  end
end
