class Notes::Line < ApplicationRecord
  has_many :notes_line_orders, class_name: 'Notes::LineOrder'
end
