defmodule BlazikenPowerPacks.SessionTest do
  use BlazikenPowerPacks.ModelCase

  alias BlazikenPowerPacks.Session

  @valid_attrs %{token: "some token"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Session.changeset(%Session{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Session.changeset(%Session{}, @invalid_attrs)
    refute changeset.valid?
  end
end
