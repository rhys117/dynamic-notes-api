module Types
  class QueryType < Types::BaseObject
    description "The query root of this shema"

    field :question, QuestionType, null: true do
      description "Find a question by ID"
      argument :id, ID, required: true
    end

    def question(id:)
      Notes::Question.find(id)
    end

    field :line, LineType, null: true do
      description "Returns a line"
      argument :id, ID, required: true
    end

    def line(id:)
      Notes::Line.find(id)
    end
  end
end
