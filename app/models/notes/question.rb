class Notes::Question < ApplicationRecord
  has_many :line_questions, foreign_key: 'notes_question_id'
  has_many :lines, through: :line_questions

  validates :name, presence: true
  validates :input, presence: true, inclusion: { in: %w(select radio text textarea) }
  validates :selections, presence: true, if: :selectable?
  validates :selections, absence:  true, unless: :selectable?

  def order(line:)
    line_questions.select(:order).where(notes_question_id: id, notes_line_id: line.id)
  end

  def selectable?
    %w(select radio).include?(input)
  end
end
