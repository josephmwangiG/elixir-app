defmodule ElixirAppWeb.CreateUser do
  use ElixirAppWeb, :live_view
  alias ElixirApp.{Users, Users.User}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, form: to_form(Users.change_user(%User{})))}
  end

  def handle_event("validate", %{"user" => params}, socket) do
    changeset = %User{} |> Users.change_user(params) |> Map.put(:action, :validate)

    {:noreply, assign(socket, form: to_form(changeset))}
  end

  def handle_event("create", %{"user" => params}, socket) do
    case Users.create_user(params) do
      {:ok, _user} ->
        changeset = Users.change_user(%User{})

        # clear form
         assign(socket, form: to_form(changeset))

        #  redirect
        {:noreply, push_redirect(socket, to: ~p"/app/users")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
