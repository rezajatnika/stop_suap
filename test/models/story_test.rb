require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  def setup
    @story = Story.new(
      title: 'Story title',
      content: 'Summary of story bla bla bla bla',
      category: categories(:tax),
      paid: 0,
      amount: 130000,
      event_date: Date.today,
      email: 'myemail@dot.com',
      location_attributes: {
        city_id: cities(:bandung).id,
        province_id: provinces(:westjava).id
      }
    )
  end

  def teardown
    @story.destroy if @story
  end

  test 'should be valid' do
    assert @story.valid?
  end

  test 'should not valid without title' do
    @story.title = ''
    assert_not @story.valid?
  end

  test 'should not valid without content' do
    @story.content = ''
    assert_not @story.valid?
  end

  test 'should not valid without category' do
    @story.category = nil
    assert_not @story.valid?
  end

  test 'should not valid without email' do
    @story.email = ''
    assert_not @story.valid?
  end

  test 'should not valid without amount' do
    @story.amount = nil
    assert_not @story.valid?
  end

  test 'should not valid without event date' do
    @story.event_date = nil
    assert_not @story.valid?
  end

  test 'should no valid without location' do
    @story.location = nil
    assert_not @story.valid?
  end

  test 'should belongs to anonymous user if not logged in' do
    @story.save
    assert_equal users(:anonymous), @story.user
  end
end
