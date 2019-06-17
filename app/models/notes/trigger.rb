class Notes::Trigger < ApplicationRecord
  belongs_to :template_part, foreign_key: :notes_template_part_id
  belongs_to :line_question, foreign_key: :notes_line_question_id
  belongs_to :triggered_template_part, class_name: 'Notes::TemplatePart', foreign_key: :triggered_notes_template_part_id
  has_one :template, through: :template_part

  validates :name, presence: true
  validates :value, presence: true
end
