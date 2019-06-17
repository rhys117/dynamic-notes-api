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
    assert @template.template_parts.ids == notes_template_parts.select { |tem_part| tem_part.template == @template }.map(&:id)
    assert @template.template_parts.pluck(:order) == notes_template_parts.select { |tem_part| tem_part.template == @template }.map(&:order)
    assert @template.parts_and_order == @template.template_parts
  end

  test "Has parts" do
    assert @template.parts.first.is_a?(Notes::Part)
    assert @template.parts == notes_template_parts.select { |tem_part| tem_part.template == @template }.map(&:part)
  end

  test "Has quetions" do
    assert @template.questions.first.is_a?(Notes::Question)
    assert @template.questions == notes_questions.select { |quest| quest.templates.include?(@template) }
  end

  test "Has triggers" do
    assert @template.triggers.first.is_a?(Notes::Trigger)
    assert @template.triggers == notes_triggers.select { |trig| trig.template == @template }
  end
end
