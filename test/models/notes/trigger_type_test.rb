require 'test_helper'

class Notes::TriggerTypeTest < ActiveSupport::TestCase
  setup do
    @trigger_type = notes_trigger_types.first
  end

  test "should be valid when all fields present" do
    assert @trigger_type.valid?
  end

  test "name should be present" do
    @trigger_type.name = '      '
    assert_not @trigger_type.valid?
  end

  test "has many triggers" do
    assert @trigger_type.triggers == notes_triggers.select { |trigger| trigger.type == @trigger_type }
  end
end
