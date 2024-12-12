defmodule TodoApiElixir.Todo.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field(:status, :integer, default: 0)
    field(:text, :string)
    field(:person_id, :integer, default: 0)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:text, :person_id, :status])
    |> validate_required([:text, :person_id, :status])
  end
end
