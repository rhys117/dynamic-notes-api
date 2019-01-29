class Notes::Line < ApplicationRecord
  def questions
    question_ids = Notes::LineQuestions.select(:notes_question_id, :order).where(notes_line_id: id)
    question_ids.map do |record|
      question = Notes::Question.find(record.notes_question_id)
      question.order = record.order
      question
    end
  end
end
