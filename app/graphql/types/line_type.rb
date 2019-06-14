class Types::LineType < Types::BaseObject
  field :id, ID, null: false
  field :description, String, null: true
  field :template_part, Types::TemplatePartType, null: false, method: :part
  field :questions_and_order, [Types::LineQuestionType], null: true
  field :order, Integer, null: false
end