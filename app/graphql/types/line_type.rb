class Types::LineType < Types::BaseObject
  field :id, ID, null: false
  field :description, String, null: true
  field :questions, [Types::LineQuestionsType], null: false
end
