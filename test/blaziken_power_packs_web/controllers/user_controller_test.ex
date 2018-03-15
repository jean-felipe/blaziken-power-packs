defmodule BlazikenPowerPacks.UserControllerTest do
  use BlazikenPowerPacksWeb.ConnCase

  alias BlazikenPowerPacks.Users

  @valid_attrs %{name: 'John Snow', email: 'john.snow@gmail.com', phone: '41 33332131', password: 'qweqwe123'}
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    body = json_response(conn, 201)
    assert body["data"]["id"]
    assert body["data"]["email"]
    assert body["data"]["name"]
    assert body["data"]["password"]
    assert Repo.get_by(User, email: "john.snow@gmail.com")
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end
end
