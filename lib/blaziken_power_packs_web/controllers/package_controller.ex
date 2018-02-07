defmodule BlazikenPowerPacksWeb.PackageController do
  use BlazikenPowerPacksWeb, :controller

  alias BlazikenPowerPacks.Packs
  alias BlazikenPowerPacks.Packs.Package

  def index(conn, _params) do
    packages = Packs.list_packages()
    render(conn, "index.html", packages: packages)
  end

  def new(conn, _params) do
    changeset = Packs.change_package(%Package{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"package" => package_params}) do
    case Packs.create_package(package_params) do
      {:ok, package} ->
        conn
        |> put_flash(:info, "Package created successfully.")
        |> redirect(to: package_path(conn, :show, package))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    package = Packs.get_package!(id)
    render(conn, "show.html", package: package)
  end

  def edit(conn, %{"id" => id}) do
    package = Packs.get_package!(id)
    changeset = Packs.change_package(package)
    render(conn, "edit.html", package: package, changeset: changeset)
  end

  def update(conn, %{"id" => id, "package" => package_params}) do
    package = Packs.get_package!(id)

    case Packs.update_package(package, package_params) do
      {:ok, package} ->
        conn
        |> put_flash(:info, "Package updated successfully.")
        |> redirect(to: package_path(conn, :show, package))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", package: package, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    package = Packs.get_package!(id)
    {:ok, _package} = Packs.delete_package(package)

    conn
    |> put_flash(:info, "Package deleted successfully.")
    |> redirect(to: package_path(conn, :index))
  end
end
