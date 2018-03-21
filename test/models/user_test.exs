defmodule Showme.UserTest do
  use Showme.ModelCase, async: true
  alias Showme.User

  test "changeset with valid attributes" do
    valid_attrs = %{name: "A User", username: "eva", password: "secret"}

    changeset = User.changeset(%User{}, valid_attrs)

    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    invalid_attrs = %{}

    changeset = User.changeset(%User{}, invalid_attrs)

    refute changeset.valid?
  end

  test "changeset does not accept long usernames" do
    invalid_attrs = %{name: "User", username: String.duplicate("a", 30), password: "secret"}

    assert {:username, "should be at most 20 character(s)"} in
           errors_on(%User{}, invalid_attrs)
  end

  test "registration_changeset password must be at least 6 chars long" do
    invalid_attrs = %{name: "User", username: "eva", password: "12345"}

    changeset = User.registration_changeset(%User{}, invalid_attrs)

    assert {:password, "should be at least 6 character(s)"} in errors_on(changeset)
  end

  test "registration_changeset with valid attributes hashes password" do
    valid_attrs = %{name: "User", username: "eva", password: "123456"}

    changeset = User.registration_changeset(%User{}, valid_attrs)
    %{password: pass, password_hash: pass_hash} = changeset.changes

    assert changeset.valid?
    assert pass_hash
    assert Comeonin.Bcrypt.checkpw(pass, pass_hash)
  end
end
