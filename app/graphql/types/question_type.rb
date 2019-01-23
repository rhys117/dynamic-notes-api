class Types::QuestionType < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: true
  field :input, String, null: false
  field :description, String, null: true
  field :selections, [String], null: true
end
