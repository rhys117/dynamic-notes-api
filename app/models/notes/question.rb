class Notes::Question < ApplicationRecord
  attr_accessor :order

  validates :name, presence: true
  validates :input, presence: true
  validates :selections, presence: true, if: :selectable?
  validates :selections, absence: true, unless: :selectable?

  def selectable?
    %w(select radio).include?(input)
  end
end
