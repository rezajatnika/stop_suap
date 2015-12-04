require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: 'User Name',
      email: 'username@email.com',
      password: 'asdqwe123',
      password_confirmation: 'asdqwe123'
    )
  end

  test 'should valid' do
    assert @user.valid?
  end

  test 'should not valid with length of email > 50' do
    @user.email = 'verylonguseremailaddressthathewonteventremember@example.net'
    assert_not @user.valid?
  end

  test 'should not valid with length of password < 8 or > 30' do
    @user.password = 'pass'
    @user.password_confirmation = 'pass'
    assert_not @user.valid?

    @user.password = 'verylongpasswordthathewontevenremember'
    @user.password_confirmation = 'verylongpasswordthathewontevenremember'
    assert_not @user.valid?
  end

  test 'should have many stories' do
    assert @user.respond_to?(:stories)
  end
end
