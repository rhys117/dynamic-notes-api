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

  test "Responds to lines" do
    assert_not @part.lines.nil?
  end

  test "Responds to questions" do
    assert_not @part.questions.nil?
  end
end
