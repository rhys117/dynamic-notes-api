class Notes::Template < ApplicationRecord
  has_many :lines, foreign_key: 'notes_template_id'
  has_many :questions, through: :lines

  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 30 }
end
