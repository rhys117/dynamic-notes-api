require 'test_helper'

class Notes::TemplateTest < ActiveSupport::TestCase
  def setup
    @template = notes_templates.first
  end

  test "Name should be present" do
    @template.name = '         '
    assert_not @template.valid?
  end

  test "Name should be valid between 5 and 50" do
    @template.name = 'Valid Name'
    assert @template.valid?
  end

  test "Description should be present" do
    @template.description = '         '
    assert_not @template.valid?
  end

  test "Has template parts and alias" do
    assert @template.template_parts.first.is_a?(Notes::TemplatePart)
    assert @template.template_parts.ids == [1, 2]
    assert @template.template_parts.pluck(:order) == [1, 2]
    assert @template.parts_and_order.ids == [1, 2]
    assert @template.parts_and_order.pluck(:order) == [1, 2]
  end

  test "Has parts" do
    assert @template.parts.first.is_a?(Notes::Part)
    assert @template.parts.ids == [1, 2]
  end

  test "Has quetions" do
    assert @template.questions.first.is_a?(Notes::Question)
    assert @template.questions.ids == [2, 1]
  end
end
