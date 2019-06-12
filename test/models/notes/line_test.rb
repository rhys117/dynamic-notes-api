require 'test_helper'

class Notes::LineTest < ActiveSupport::TestCase
  def setup
    @line = notes_lines.first
  end

  test "Template part id is present" do
    @line.template_part = nil
    assert_not @line.valid?
  end

  test "Responds to questions" do
    assert_not @line.questions.nil?
  end

  test "Order is present" do
    @line.order = nil
    assert_not @line.valid?
  end

  test "Order is unique" do
    @other_line = notes_lines.last
    @other_line.order = @line.order
    assert_not @other_line.valid?
  end
end
