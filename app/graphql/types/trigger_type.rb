class Types::TriggerType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :value, String, null: false
  field :type, String, null: false, method: :type_name
end