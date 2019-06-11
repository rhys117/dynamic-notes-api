class Types::TemplateType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :lines, [Types::LineType], null: true
end
