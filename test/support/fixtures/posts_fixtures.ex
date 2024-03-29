defmodule ElixirApp.PostsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElixirApp.Posts` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> ElixirApp.Posts.create_post()

    post
  end
end
