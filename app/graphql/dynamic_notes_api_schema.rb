class DynamicNotesApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
