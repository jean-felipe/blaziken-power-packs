defmodule BlazikenPowerPacksWeb.PageController do
  use BlazikenPowerPacksWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
