require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'Traffic Ticket')
  end

  test 'should be valid' do
    assert @category.valid?
  end

  test 'should not valid without name' do
    @category.name = ''
    assert_not @category.valid?
  end

  test 'should have many stories' do
    assert @category.respond_to?(:stories)
  end
end
