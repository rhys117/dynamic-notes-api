class Types::QuestionType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: true
  field :input, String, null: false
  field :description, String, null: true
  field :selectable, Boolean, null: false, method: :selectable?
  field :selections, [String], null: true
  field :placeholder, String, null: true
end
