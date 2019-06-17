require 'test_helper'

class Notes::TriggerTest < ActiveSupport::TestCase
  setup do
    @trigger = notes_triggers.first
  end

  test "should be valid when has all fields set" do
    assert @trigger.valid?
  end

  test "belongs to a template part" do
    @trigger.template_part = nil
    assert_not @trigger.valid?
    assert @trigger.errors[:template_part].include?('must exist')
  end

  test "belongs to a line question" do
    @trigger.line_question = nil
    assert_not @trigger.valid?
    assert @trigger.errors[:line_question].include?('must exist')
  end

  test "belongs to a triggered template part" do
    @trigger.triggered_template_part = nil
    assert_not @trigger.valid?
    assert @trigger.errors[:triggered_template_part].include?('must exist')
  end

  test "has one template" do
    templates_with_trigger = notes_templates.select { |temp| temp.triggers.include?(@trigger) }
    assert templates_with_trigger.count == 1
    assert @trigger.template == templates_with_trigger.first
  end

  test "must have a name" do
    @trigger.name = '     '
    assert_not @trigger.valid?
    assert @trigger.errors[:name].include?("can't be blank")
  end

  test "must have a value" do
    @trigger.value = '     '
    assert_not @trigger.valid?
    assert @trigger.errors[:value].include?("can't be blank")
  end
end
