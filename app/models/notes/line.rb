class Notes::Line < ApplicationRecord
  belongs_to :template, foreign_key: 'notes_template_id'
  has_many :line_questions, foreign_key: 'notes_line_id'
  has_many :questions, through: :line_questions

  alias_attribute :questions_and_order, :line_questions

  validates :order, presence: true, uniqueness: true
end
