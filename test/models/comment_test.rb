require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @story = Story.create(
      title: 'Story title',
      content: 'Summary of story bla bla bla bla',
      category: categories(:tax),
      amount: 130000,
      event_date: Date.today,
      email: 'myemail@dot.com',
      location_attributes: {
        city_id: cities(:bandung).id,
        province_id: provinces(:westjava).id
      }
    )
    @comment = @story.comments.new(body: 'blabala')
  end

  def teardown
    @story.destroy
  end

  test "Should be valid" do
    assert @comment.valid?
  end

  test "Not valid" do
    @comment.body = ''
    assert_not @comment.valid?
  end
end
