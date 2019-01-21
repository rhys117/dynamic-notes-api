require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'Speed', description: 'Speed issues of services', tags: %w(tag1 tag2))
  end

  test 'should be valid' do
    assert @category.valid?
  end

  test 'name should be present' do
    @category.name = '    '
    assert_not @category.valid?
  end

  test 'name should not exceed 50 chars' do
    @category.name = 'a' * 51
    assert_not @category.valid?
  end
end
