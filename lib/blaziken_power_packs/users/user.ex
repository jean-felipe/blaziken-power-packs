defmodule BlazikenPowerPacks.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlazikenPowerPacks.Users.User


  schema "users" do
    field :city, :string
    field :cpf, :string
    field :email, :string
    field :gender, :integer
    field :name, :string
    field :neighborhood, :string
    field :password_hash, :string
    field :phone, :string
    field :state, :integer
    field :status, :integer
    field :street, :string
    field :street_number, :integer
    field :zipcode, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :phone, :password_hash, :gender, :status, :street, :street_number, :zipcode, :city, :state, :neighborhood, :cpf])
    |> validate_required([:name, :email, :phone, :password_hash, :gender, :status, :street, :street_number, :zipcode, :city, :state, :neighborhood, :cpf])
  end
end
