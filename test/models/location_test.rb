require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  def setup
    @location = Location.new(
      province: provinces(:westjava), city: cities(:bandung)
    )
  end

  test 'should be valid' do
    assert @location.valid?
  end

  test 'should not valid without province' do
    @location.province = nil
    assert_not @location.valid?
  end

  test 'should not valid without city' do
    @location.city = nil
    assert_not @location.valid?
  end

  test 'should belongs to story' do
    assert @location.respond_to?(:story)
  end
end
