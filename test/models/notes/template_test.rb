require 'test_helper'

class Notes::TemplateTest < ActiveSupport::TestCase
  def setup
    @template = notes_templates.first
  end

  test "Name should be present" do
    @template.name = '         '
    assert_not @template.valid?
  end

  test "Name should have a minimum length of 5" do
    @template.name = 'Nope'
    assert_not @template.valid?
  end

  test "Name should be valid between 5 and 100" do
    @template.name = 'Valid Name'
    assert @template.valid?
  end

  test "Responds to lines" do
    assert_not @template.lines.nil?
  end

  test "Responds to questions" do
    assert_not @template.questions.nil?
  end
end
