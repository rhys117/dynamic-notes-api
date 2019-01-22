module Types
  class QueryType < Types::BaseObject
    description "The query root of this shema"

    field :question, QuestionType, null: true do
      description "Find a question by ID"
      argument :id, ID, required: true
    end

    def question(id:)
      # binding.pry
      Notes::Question.find(id)
    end
  end
end
