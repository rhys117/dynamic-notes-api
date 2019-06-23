class Types::TemplatePartType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :lines_and_order, [Types::LineAndOrderType], null: true
  field :lines, [Types::LineType], null: true
end
