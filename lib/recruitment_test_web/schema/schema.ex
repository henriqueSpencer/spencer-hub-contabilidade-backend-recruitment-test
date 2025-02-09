defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema
  import_types(RecruitmentTestWeb.Schema.ContentTypes)

  alias RecruitmentTestWeb.Resolvers

  object :enterprise do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :commercial_name, :string
    field :cnpj, :string
    field :description, :string
  end

  query do
    @desc "Returns a Hello World message"
    field :hello_world, :string do
      resolve(&Resolvers.HelloWorld.get/3)
    end

    @desc "Get an enterprise by ID"
    field :enterprise, :enterprise do
      arg :id, non_null(:id)
      resolve(fn _, %{id: id}, _ ->
        # Simulação de uma busca no banco de dados
        enterprise = get_enterprise(id)

        case enterprise do
          nil -> {:error, "Enterprise not found"}
          _ -> {:ok, enterprise}
        end
      end)
    end

    # Simulação de um banco de dados em memória
    defp get_enterprise(id) do
      mock_data = [
        %{id: "1", name: "Tech Solutions", commercial_name: "TechSol", cnpj: "12345678000190", description: "Empresa de tecnologia"},
        %{id: "2", name: "Green Corp", commercial_name: "Green", cnpj: "98765432000112", description: "Soluções ambientais"}
      ]

      Enum.find(mock_data, fn enterprise -> enterprise.id == to_string(id) end)
    end

  end

end
