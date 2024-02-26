defmodule ElixirAppWeb.PostJSON do
  alias ElixirApp.Posts.Post
  alias ElixirApp.Users.User

  @doc """
  Renders a list of posts.
  """
  def index(%{posts: posts}) do
    %{data: for(post <- posts, do: data(post))}
  end

  @doc """
  Renders a single post.
  """
  def show(%{post: post}) do
    %{data: data(post)}
  end

  defp data(%Post{} = post) do
    %{
      id: post.id,
      content: post.content,
      title: post.title,
      user: user_data(post.user),
    }
  end


  defp user_data(%User{} = user) do
    %{
      id: user.id,
      email: user.email,
      username: user.username,
    }
  end
end
