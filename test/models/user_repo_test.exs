defmodule Showme.UserRepoTest do
  use Showme.ModelCase

  alias Showme.User

  test "converts unique_constraint on username to error" do
    insert_user(username: "eric")

    valid_attrs = %{name: "A User", username: "eric"}
    changeset = User.changeset(%User{}, valid_attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert {:username, "has already been taken"} in errors_on(changeset)
  end
end
