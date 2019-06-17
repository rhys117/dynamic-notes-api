class Notes::Part < ApplicationRecord
  has_many :part_lines, foreign_key: 'notes_part_id'
  has_many :lines, through: :part_lines
  has_many :questions, -> { order(:id) }, through: :lines
  has_many :templates_and_order, class_name: 'Notes::TemplatePart', foreign_key: 'notes_part_id'
  has_many :templates, through: :templates_and_order

  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 30 }
end
