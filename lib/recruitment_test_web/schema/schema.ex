defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema
  import_types(RecruitmentTestWeb.Schema.ContentTypes)

  alias RecruitmentTestWeb.Resolvers


  query do
    @desc "Returns a Hello World message"
    field :hello_world, :string do
      resolve(&Resolvers.HelloWorld.get/3)
    end

    @desc "Get an enterprise by ID"
    field :enterprise, :enterprise do
      arg :id, non_null(:id)
      resolve(&Resolvers.Enterprise.get/3)
    end

  end

  mutation do
    # Mutations relacionadas à Enterprise
    @desc "Register a new enterprise"
    field :register_enterprise, :enterprise do
      arg :input, non_null(:enterprise_input)
      resolve(&Resolvers.Enterprise.registered/3)
    end

    @desc "Update an enterprise"
    field :update_enterprise, :enterprise do
      arg :id, non_null(:id)
      arg :input, non_null(:enterprise_input)
      resolve(&Resolvers.Enterprise.modified/3)
    end

    @desc "Remove an enterprise"
    field :remove_enterprise, :boolean do
      arg :id, non_null(:id)
      resolve(&Resolvers.Enterprise.removed/3)
    end
  end

end
