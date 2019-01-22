class Notes::Line < ApplicationRecord
  has_many :order, class_name: 'Notes::LineOrder', foreign_key: 'notes_line_id'
end
