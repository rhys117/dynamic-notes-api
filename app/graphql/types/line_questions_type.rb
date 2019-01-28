class Types::LineQuestionsType < Types::BaseObject
  field :id, ID, null: false
  field :question, Types::QuestionType, null: false
  field :order, Integer, null: false
end
