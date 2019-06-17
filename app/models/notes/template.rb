class Notes::Template < ApplicationRecord
  has_many :template_parts, class_name: "Notes::TemplatePart", foreign_key: :notes_template_id
  has_many :parts, through: :template_parts
  has_many :part_lines, through: :parts
  has_many :lines, through: :part_lines
  has_many :questions, through: :parts
  has_many :triggers, through: :template_parts

  alias_attribute :parts_and_order, :template_parts

  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true
end
