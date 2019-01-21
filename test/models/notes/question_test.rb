require 'test_helper'

class Notes::QuestionTest < ActiveSupport::TestCase
  def setup
    @select_question = notes_questions(:select_case)
    @text_question = notes_questions(:text_case)
  end

  test 'select question valid' do
    assert @select_question.valid?
  end

  test 'text question valid' do
    assert @text_question.valid?
  end

  test 'selectable inputs require selections' do
    @select_question.selections = nil
    assert_not @select_question.valid?
  end

  test 'non selectable inputs do not allow selections' do
    @text_question.selections = %w(one two)
    assert_not @text_question.valid?
  end
end
