defmodule ElixirAppWeb.PageController do
  use ElixirAppWeb, :controller

  def home(conn, _params) do
    redirect(conn, to: ~p"/app")
  end
end
