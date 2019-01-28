class Notes::Line < ApplicationRecord
  has_many :line_questions, class_name: 'Notes::LineQuestions', foreign_key: 'note_questions_line_id'

  def questions
    line_questions.map do |line_question|
      binding.pry
      line_question.question
    end
  end
end
