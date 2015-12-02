require 'test_helper'

class CityTest < ActiveSupport::TestCase
  def setup
    @city = provinces(:westjava).cities.new(name: 'Kota Bogor')
  end

  test 'should be valid' do
    assert @city.valid?
  end

  test 'should not valid without name' do
    @city.name = ''
    assert_not @city.valid?
  end

  test 'should belongs to province' do
    assert @city.respond_to?(:province)
  end
end
