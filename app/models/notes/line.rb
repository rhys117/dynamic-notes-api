class Notes::Line < ApplicationRecord
  has_many :part_lines, foreign_key: 'notes_line_id'
  has_many :parts, through: :part_lines
  has_many :line_questions, foreign_key: 'notes_line_id'
  has_many :questions, through: :line_questions

  alias_attribute :questions_and_order, :line_questions
end
