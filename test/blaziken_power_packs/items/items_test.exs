defmodule BlazikenPowerPacks.ItemsTest do
  use BlazikenPowerPacks.DataCase

  alias BlazikenPowerPacks.Items

  describe "items" do
    alias BlazikenPowerPacks.Items.Item

    @valid_attrs %{description: "some description", image_url: "some image_url", item_type: 42, name: "some name", price: "120.5", status: 42, supplier_id: 42}
    @update_attrs %{description: "some updated description", image_url: "some updated image_url", item_type: 43, name: "some updated name", price: "456.7", status: 43, supplier_id: 43}
    @invalid_attrs %{description: nil, image_url: nil, item_type: nil, name: nil, price: nil, status: nil, supplier_id: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Items.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Items.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Items.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Items.create_item(@valid_attrs)
      assert item.description == "some description"
      assert item.image_url == "some image_url"
      assert item.item_type == 42
      assert item.name == "some name"
      assert item.price == Decimal.new("120.5")
      assert item.status == 42
      assert item.supplier_id == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Items.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.description == "some updated description"
      assert item.image_url == "some updated image_url"
      assert item.item_type == 43
      assert item.name == "some updated name"
      assert item.price == Decimal.new("456.7")
      assert item.status == 43
      assert item.supplier_id == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_item(item, @invalid_attrs)
      assert item == Items.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Items.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Items.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Items.change_item(item)
    end
  end
end
