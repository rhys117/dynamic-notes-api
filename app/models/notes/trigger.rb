class Notes::Trigger < ApplicationRecord
  belongs_to :template_part, foreign_key: :notes_template_part_id
  belongs_to :line_question, foreign_key: :notes_line_question_id
  belongs_to :triggered_template_part, class_name: 'Notes::TemplatePart', foreign_key: :triggered_notes_template_part_id
  belongs_to :trigger_type, class_name: "Notes::TriggerType", foreign_key: :notes_trigger_type_id
  has_one :template, through: :template_part

  alias_attribute :type, :trigger_type

  validates :name, presence: true
  validates :value, presence: true, if: :value_change_type?

  def value_change_type?
    type&.name == 'value_change'
  end

  def type_name
    type.name
  end
end
