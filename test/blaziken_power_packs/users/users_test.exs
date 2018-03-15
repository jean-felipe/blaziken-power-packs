defmodule BlazikenPowerPacks.UsersTest do
  use BlazikenPowerPacks.DataCase

  alias BlazikenPowerPacks.Users

  describe "users" do
    alias BlazikenPowerPacks.Users.User

    @valid_attrs %{city: "some city", cpf: "some cpf", email: "some email", gender: 42, name: "some name", neighborhood: "some neighborhood", password_hash: "some password_hash", phone: "some phone", state: 42, status: 42, street: "some street", street_number: 42, zipcode: "some zipcode"}
    @update_attrs %{city: "some updated city", cpf: "some updated cpf", email: "some updated email", gender: 43, name: "some updated name", neighborhood: "some updated neighborhood", password_hash: "some updated password_hash", phone: "some updated phone", state: 43, status: 43, street: "some updated street", street_number: 43, zipcode: "some updated zipcode"}
    @invalid_attrs %{city: nil, cpf: nil, email: nil, gender: nil, name: nil, neighborhood: nil, password_hash: nil, phone: nil, state: nil, status: nil, street: nil, street_number: nil, zipcode: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.city == "some city"
      assert user.cpf == "some cpf"
      assert user.email == "some email"
      assert user.gender == 42
      assert user.name == "some name"
      assert user.neighborhood == "some neighborhood"
      assert user.password_hash == "some password_hash"
      assert user.phone == "some phone"
      assert user.state == 42
      assert user.status == 42
      assert user.street == "some street"
      assert user.street_number == 42
      assert user.zipcode == "some zipcode"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Users.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.city == "some updated city"
      assert user.cpf == "some updated cpf"
      assert user.email == "some updated email"
      assert user.gender == 43
      assert user.name == "some updated name"
      assert user.neighborhood == "some updated neighborhood"
      assert user.password_hash == "some updated password_hash"
      assert user.phone == "some updated phone"
      assert user.state == 43
      assert user.status == 43
      assert user.street == "some updated street"
      assert user.street_number == 43
      assert user.zipcode == "some updated zipcode"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
