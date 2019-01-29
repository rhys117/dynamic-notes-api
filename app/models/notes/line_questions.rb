class Notes::LineQuestions < ApplicationRecord
  belongs_to :line, class_name: 'Notes::Line', foreign_key: 'notes_line_id'
  belongs_to :question, class_name: 'Notes::Question', foreign_key: 'notes_question_id'

  validates :notes_question_id, presence: true
  validates :order, presence: true, uniqueness: { scope: :notes_line_id }
end
