class Notes::Line < ApplicationRecord
  has_many :line_questions, foreign_key: 'notes_line_id'
  has_many :questions, through: :line_questions
  has_many :part_lines, foreign_key: 'notes_line_id'
  has_many :parts, through: :part_lines

  alias_attribute :questions_and_order, :line_questions

  validates :order, presence: true, uniqueness: { scope: :part }
end
