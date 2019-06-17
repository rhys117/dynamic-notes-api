class Notes::PartLine < ApplicationRecord
  belongs_to :part, foreign_key: 'notes_part_id'
  belongs_to :line, foreign_key: 'notes_line_id'

  validates :order, presence: true, uniqueness: { scope: :part }
end
