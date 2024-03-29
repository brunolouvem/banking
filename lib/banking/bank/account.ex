defmodule Banking.Bank.Account do
  @moduledoc """
  Account entity, responsible for user's personal data
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "accounts" do
    has_one :balance, Banking.Bank.Balance
    belongs_to :user, Banking.Auth.User, type: :binary_id
    field :name, :string

    timestamps()
  end

  @required_fields ~w(name user_id)a

  def changeset(account, attrs) do
    account
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end
end
