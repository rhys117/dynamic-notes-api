module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :question, QuestionType, null: true do
      description "Find a question by ID"
      argument :id, ID, required: true
    end

    def question(id:)
      Notes::Question.find(id)
    end

    field :line, LineType, null: false do
      description "Find a template line by ID"
      argument :id, ID, required: true
    end

    def line(id:)
      Notes::Line.find(id)
    end

    #
    # # Need to define template model
    # field :template, TemplateType, null: false do
    #   description "Returns a template by ID"
    #   argument :id, ID, required: true
    # end
  end
end
