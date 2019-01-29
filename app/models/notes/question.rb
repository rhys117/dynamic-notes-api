class Notes::Question < ApplicationRecord
  attr_accessor :order

  validates :name, presence: true
  validates :input, presence: true
  validates :selections, presence: true, if: :selectable?
  validates :selections, absence: true, unless: :selectable?

  def lines
    lines_ids = Notes::LineQuestions.select(:notes_line_id).where(notes_question_id: id)
    lines_ids.map { |record| Notes::Line.find(record.notes_line_id) }
  end

  def selectable?
    %w(select radio).include?(input)
  end
end
