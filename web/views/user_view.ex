defmodule Showme.UserView do
  use Showme.Web, :view
  alias Showme.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end