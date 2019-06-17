require 'test_helper'

class Notes::PartTest < ActiveSupport::TestCase
  def setup
    @part = notes_parts.first
  end

  test "Name should be present" do
    @part.name = '         '
    assert_not @part.valid?
  end

  test "Name should have a minimum length of 5" do
    @part.name = 'Nope'
    assert_not @part.valid?
  end

  test "Name should be valid between 5 and 30" do
    @part.name = 'Valid Name'
    assert @part.valid?
  end

  test "has many lines" do
    assert @part.lines == notes_lines.select { |line| line.parts.include?(@part) }
  end

  test "has many questions" do
    assert @part.questions == notes_questions.select { |quest| quest.parts.include?(@part) }
  end

  test "has many templates and order (template parts alias)" do
    assert @part.templates_and_order == notes_template_parts.select { |temp_part| temp_part.part == @part }
  end

  test "has many templates" do
    assert @part.templates == notes_templates.select { |template| template.parts.include?(@part) }
  end
end
