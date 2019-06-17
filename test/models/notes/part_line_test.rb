require 'test_helper'

class Notes::PartLineTest < ActiveSupport::TestCase
  setup do
    @part_line = notes_part_lines.first
  end

  test "Part is present" do
    @part_line.part = nil
    assert_not @part_line.valid?
    assert @part_line.errors[:part].include? 'must exist'
  end

  test "Order is present" do
    @part_line.order = nil
    assert_not @part_line.valid?
    assert @part_line.errors[:order].include? "can't be blank"
  end

  test "Order is unique" do
    @other_line = notes_part_lines.last
    @other_line.order = @part_line.order
    assert_not @other_line.valid?
    assert @other_line.errors[:order].include? 'has already been taken'
  end
end
