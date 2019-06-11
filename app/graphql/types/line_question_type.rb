class Types::LineQuestionType < Types::BaseObject
  field :id, ID, null: false
  field :question, Types::QuestionType, null: false
  field :line, Types::LineType, null: false
  field :order, Integer, null: false
end