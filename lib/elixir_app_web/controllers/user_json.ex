defmodule ElixirAppWeb.UserJSON do
  alias ElixirApp.Users.User
  alias ElixirApp.Posts.Post

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      username: user.username,
      email: user.email,
      password: user.password,
      posts: for(post <- user.posts, do: post_data(post))
    }
  end


  defp post_data(%Post{} = post) do
    %{
      id: post.id,
      title: post.title,
      content: post.content
    }
  end
end
