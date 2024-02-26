defmodule ElixirAppWeb.UsersPage do
  use ElixirAppWeb, :live_view
  alias ElixirApp.Users


  def mount(_params, _session, socket) do
    users = Users.list_users()
    {:ok, assign(socket, users: users)}
  end

end
