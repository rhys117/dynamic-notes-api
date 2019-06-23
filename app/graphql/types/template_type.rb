class Types::TemplateType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :description, String, null: false
  field :triggers, [Types::TriggerType], null: true
  field :parts_and_order, [Types::TemplatePartAndOrderType], null: true
end