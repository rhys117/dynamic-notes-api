class Notes::TemplatePart < ApplicationRecord
  belongs_to :template, class_name: "Notes::Template", foreign_key: 'notes_template_id'
  belongs_to :part, class_name: "Notes::Part", foreign_key: 'notes_part_id'
  has_many :triggers, class_name: "Notes::Trigger", foreign_key: 'notes_template_part_id'

  validates :order, presence: true, uniqueness: { scope: :template }
  validates :static, presence: true
end
