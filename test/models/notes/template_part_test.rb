require 'test_helper'

class Notes::TemplatePartTest < ActiveSupport::TestCase
  def setup
    @template_part = notes_template_parts.first
  end

  test "must have template id" do
    @template_part.template = nil
    assert_not @template_part.valid?
    assert @template_part.errors[:template].include?('must exist')
  end

  test "must have part id" do
    @template_part.part = nil
    assert_not @template_part.valid?
    assert @template_part.errors[:part].include?('must exist')
  end

  test "static must be present" do
    @template_part.static = nil
    assert_not @template_part.valid?
  end

  test "static field is set to false by default" do
    assert_not Notes::TemplatePart.new.static
  end

  test "order must be present" do
    @template_part.order = nil
    assert_not @template_part.valid?
    assert @template_part.errors[:order].include?("can't be blank")
  end

  test "order must be unique for each template" do
    @template_part.order = 2
    assert_not @template_part.valid?
    @template_part.errors[:order].include?('has already been taken')
  end
end
