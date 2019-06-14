class Notes::Line < ApplicationRecord
  belongs_to :part, foreign_key: 'notes_part_id'
  has_many :line_questions, foreign_key: 'notes_line_id'
  has_many :questions, through: :line_questions

  alias_attribute :questions_and_order, :line_questions
  alias_attribute :template_part, :part

  validates :order, presence: true, uniqueness: { scope: :part }
end
