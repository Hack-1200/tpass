require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user=User.new(name:"Ibra", email:"vvv@gmail.com", password:"rebj1234", password_confirmation:"rebj1234")
  end

  test "for user" do
  	assert @user.valid?
  end

  test "name should be valid" do
  	@user.name="    "
  	assert_not @user.valid?, @user.errors.full_messages
  end

  test "email should be valid" do
  	@user.email="    "
  	assert_not @user.valid?, @user.errors.full_messages
  end

  test "name shouldn't be too long" do 
  	@user.name="a"*51
  	assert_not @user.valid?
  end

  test "email shouldn't be too long" do
  	@user.email="a"*244+"@example.com"
  	assert_not @user.valid?
  end

  test "format of email" do
  	valid_addresses=%w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
    	@user.email=valid_address
    	assert @user.valid?,"#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "duplicate user" do
  	dup_user=@user.dup
  	dup_user.email=@user.email.upcase
  	@user.save
  	assert_not dup_user.valid?
  end

  test "before_save" do
  	user_ename="FooBar@ExaMplE.Com"
  	@user.email=user_ename
  	@user.save 
  	assert_equal user_ename.downcase, @user.email
  end

  test "secure password shouldn't be blank" do
  	@user.password=@user.password_confirmation=" "*6
  	assert_not @user.valid?
  end

  test "minimum 6 char" do 
  	@user.password=@user.password_confirmation="a"*5
  	assert_not @user.valid?
  end

end
