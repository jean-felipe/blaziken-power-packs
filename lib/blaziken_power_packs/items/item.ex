defmodule BlazikenPowerPacks.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlazikenPowerPacks.Items.Item


  schema "items" do
    field :description, :string
    field :image_url, :string
    field :item_type, :integer
    field :name, :string
    field :price, :decimal
    field :status, :integer
    field :supplier_id, :integer

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :price, :description, :supplier_id, :status, :item_type, :image_url])
    |> validate_required([:name, :price, :description, :supplier_id, :status, :item_type, :image_url])
  end
end
