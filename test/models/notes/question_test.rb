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

  test 'must have name' do
    @select_question.name = ' '
    assert_not @select_question.valid?
  end

  test 'must have input' do
    @select_question.input = ' '
    assert_not @select_question.valid?
  end

  test 'selectable inputs require selections' do
    @select_question.selections = nil
    assert_not @select_question.valid?
  end
  
  test 'non selectable inputs do not allow selections' do
    @text_question.selections = %w(one two)
    assert_not @text_question.valid?
  end

  test 'Responds to lines' do
    assert_not @text_question.lines.nil?
  end

  test 'Responds correctly to selectable?' do
    assert_not @text_question.selectable?
    assert @select_question.selectable?
  end
end
