class Notes::Question < ApplicationRecord
  validates :selections, presence: true, if: :selectable?
  validates :selections, absence: true, unless: :selectable?

  def selectable?
    %w(select radio).include?(input)
  end
end
