class Notes::Template < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true
end
