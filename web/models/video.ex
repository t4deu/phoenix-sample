defmodule Showme.Video do
  use Showme.Web, :model

  schema "videos" do
    field(:url, :string)
    field(:title, :string)
    field(:description, :string)
    belongs_to(:user, Showme.User, foreign_key: :user_id)
    belongs_to(:category, Showme.Category)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :title, :description])
    |> assoc_constraint(:category)
    |> validate_required([:url, :title, :description])
  end
end
