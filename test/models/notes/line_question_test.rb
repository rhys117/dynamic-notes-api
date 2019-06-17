require 'test_helper'

class Notes::LineQuestionTest < ActiveSupport::TestCase
  def setup
    @line_question = notes_line_questions.first
  end

  test "Notes line id is present" do
    @line_question.line = nil
    assert_not @line_question.valid?
  end

  test "Notes question id is present" do
    @line_question.question = nil
    assert_not @line_question.valid?
  end

  test "Responds to question" do
    assert_not @line_question.question.nil?
  end

  test "Responds to line" do
    assert_not @line_question.line.nil?
  end

  test "Order should be present" do
    @line_question.order = nil
    assert_not @line_question.valid?
  end

  test "Order should be unique" do
    @other_line_question = notes_line_questions.last
    @line_question.order = @other_line_question.order
    assert_not @line_question.valid?
  end
end
