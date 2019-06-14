class Notes::Part < ApplicationRecord
  has_many :lines, foreign_key: 'notes_part_id'
  has_many :questions, through: :lines

  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 30 }
end
