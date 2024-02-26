defmodule ElixirApp.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :title, :string
    field :content, :string
    belongs_to  :user, ElixirApp.Users.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:content, :title, :user_id])
    |> validate_required([:content, :title, :user_id])
  end
end
