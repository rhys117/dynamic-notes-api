class Notes::LineQuestions < ApplicationRecord
  belongs_to :notes_line, class_name: 'Notes::Line'

  validates :notes_question_id, presence: true
  validates :order, presence: true, uniqueness: { scope: :notes_line_id }

  def question
    record = Notes::Question.find(notes_question_id)
    record.order = order
    record
  end
end
