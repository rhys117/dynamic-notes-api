require 'test_helper'

class Notes::TemplatePartTest < ActiveSupport::TestCase
  def setup
    @template_part = notes_template_parts.first
  end

  test "Name should be present" do
    @template_part.name = '         '
    assert_not @template_part.valid?
  end

  test "Name should have a minimum length of 5" do
    @template_part.name = 'Nope'
    assert_not @template_part.valid?
  end

  test "Name should be valid between 5 and 30" do
    @template_part.name = 'Valid Name'
    assert @template_part.valid?
  end

  test "Responds to lines" do
    assert_not @template_part.lines.nil?
  end

  test "Responds to questions" do
    assert_not @template_part.questions.nil?
  end
end
