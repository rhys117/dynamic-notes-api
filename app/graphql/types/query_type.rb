module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :template, TemplateType, null: false do
      description "Find a template by id"
      argument :id, ID, required: true
    end

    def template(id:)
      Notes::Template.find(id)
    end

    field :template_part, TemplatePartType, null: false do
      description "Find a template part by id"
      argument :id, ID, required: true
    end

    def template_part(id:)
      Notes::Part.find(id)
    end

    field :all_template_parts, [TemplatePartType], null: true do
      description "Return all templates"
    end

    def all_template_parts
      Notes::Part.all
    end

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
  end
end
