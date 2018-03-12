alias Showme.Repo
alias Showme.Category

for category <- ~w(Action Drama Romance Comedy Sci-fi) do
  Repo.get_by(Category, name: category) || Repo.insert!(%Category{name: category})
end
