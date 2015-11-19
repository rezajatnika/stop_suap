require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      username: 'username',
      email: 'username@email.com',
      password: 'asdqwe123',
      password_confirmation: 'asdqwe123'
    )
  end

  test 'should valid' do
    assert @user.valid?
  end

  test 'should be valid with length of username in 5..25' do
    @user.username = 'five5'
    assert @user.valid?

    @user.username = 'five5' * 5
    assert @user.valid?
  end

  test 'should not valid with length of username < 5 or > 25' do
    @user.username = 'four'
    assert_not @user.valid?

    @user.username = 'five5' * 26
    assert_not @user.valid?
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
end
