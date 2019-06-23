class Types::TemplatePartAndOrderType < Types::BaseObject
  field :id, ID, null: false
  field :static, Boolean, null: false
  field :order, Integer, null: false
  field :part, Types::TemplatePartType, null: false
end