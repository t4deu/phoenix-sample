defmodule Showme.PageController do
  use Showme.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
