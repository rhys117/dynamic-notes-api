class Notes::LineOrder < ApplicationRecord
  belongs_to :notes_line, class_name: 'Notes::Line'
  has_many :notes_questions, class_name: 'Notes::Question'

  validates :notes_question_id, presence: true
  validates :order, presence: true, uniqueness: { scope: :notes_line_id }
end
