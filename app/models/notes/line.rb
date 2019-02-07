class Notes::Line < ApplicationRecord
  has_many :line_questions, foreign_key: 'notes_line_id'
  has_many :questions, through: :line_questions
end
