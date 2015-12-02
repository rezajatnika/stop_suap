require 'test_helper'

class ProvinceTest < ActiveSupport::TestCase
  def setup
    @province = Province.new(name: 'Aceh')
  end

  test 'should be valid' do
    assert @province.valid?
  end

  test 'should not valid without name' do
    @province.name = ''
    assert_not @province.valid?
  end

  test 'should have many cities' do
    assert provinces(:westjava).respond_to?(:cities)
  end
end
