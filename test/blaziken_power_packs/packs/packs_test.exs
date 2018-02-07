defmodule BlazikenPowerPacks.PacksTest do
  use BlazikenPowerPacks.DataCase

  alias BlazikenPowerPacks.Packs

  describe "packages" do
    alias BlazikenPowerPacks.Packs.Package

    @valid_attrs %{days: 42, description: "some description", image_url: "some image_url", name: "some name", price: "120.5", status: 42}
    @update_attrs %{days: 43, description: "some updated description", image_url: "some updated image_url", name: "some updated name", price: "456.7", status: 43}
    @invalid_attrs %{days: nil, description: nil, image_url: nil, name: nil, price: nil, status: nil}

    def package_fixture(attrs \\ %{}) do
      {:ok, package} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Packs.create_package()

      package
    end

    test "list_packages/0 returns all packages" do
      package = package_fixture()
      assert Packs.list_packages() == [package]
    end

    test "get_package!/1 returns the package with given id" do
      package = package_fixture()
      assert Packs.get_package!(package.id) == package
    end

    test "create_package/1 with valid data creates a package" do
      assert {:ok, %Package{} = package} = Packs.create_package(@valid_attrs)
      assert package.days == 42
      assert package.description == "some description"
      assert package.image_url == "some image_url"
      assert package.name == "some name"
      assert package.price == Decimal.new("120.5")
      assert package.status == 42
    end

    test "create_package/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Packs.create_package(@invalid_attrs)
    end

    test "update_package/2 with valid data updates the package" do
      package = package_fixture()
      assert {:ok, package} = Packs.update_package(package, @update_attrs)
      assert %Package{} = package
      assert package.days == 43
      assert package.description == "some updated description"
      assert package.image_url == "some updated image_url"
      assert package.name == "some updated name"
      assert package.price == Decimal.new("456.7")
      assert package.status == 43
    end

    test "update_package/2 with invalid data returns error changeset" do
      package = package_fixture()
      assert {:error, %Ecto.Changeset{}} = Packs.update_package(package, @invalid_attrs)
      assert package == Packs.get_package!(package.id)
    end

    test "delete_package/1 deletes the package" do
      package = package_fixture()
      assert {:ok, %Package{}} = Packs.delete_package(package)
      assert_raise Ecto.NoResultsError, fn -> Packs.get_package!(package.id) end
    end

    test "change_package/1 returns a package changeset" do
      package = package_fixture()
      assert %Ecto.Changeset{} = Packs.change_package(package)
    end
  end
end
