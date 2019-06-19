class Notes::TriggerType < ApplicationRecord
  has_many :triggers, foreign_key: :notes_trigger_type_id

  validates :name, presence: true
end
