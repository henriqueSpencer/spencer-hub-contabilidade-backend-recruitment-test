defmodule RecruitmentTestWeb.Schema.ContentTypes do
  use Absinthe.Schema.Notation

  object :hello_world do
    field :message, :string
  end

  object :enterprise do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :commercial_name, :string
    field :cnpj, :string
    field :description, :string
    # field :inserted_at, :naive_datetime
    # field :updated_at, :naive_datetime
  end


  # Input Object para mutations
  input_object :enterprise_input do
    field :name, non_null(:string)
    field :commercial_name, :string
    field :cnpj, :string
    field :description, :string
  end
end
