class Types::LineAndOrderType < Types::BaseObject
  field :order, Integer, null: false
  field :line, Types::LineType, null: false
end