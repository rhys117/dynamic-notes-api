require 'test_helper'

class Notes::LineTest < ActiveSupport::TestCase
  def setup
    @line = notes_lines.first
  end

  test "Has many part lines" do
    assert @line.part_lines == notes_part_lines.select { |part_line| part_line.line == @line }
  end

  test "Responds to questions" do
    assert_not @line.questions.nil?
  end
end
