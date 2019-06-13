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
end
