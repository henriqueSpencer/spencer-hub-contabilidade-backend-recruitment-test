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

end
