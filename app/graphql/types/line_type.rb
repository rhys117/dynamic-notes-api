class Types::LineType < Types::BaseObject
  field :id, ID, null: false
  field :description, String, null: true
  field :template, Types::TemplateType, null: false
  field :questions_and_order, [Types::LineQuestionType], null: true
  field :order, Integer, null: false
end