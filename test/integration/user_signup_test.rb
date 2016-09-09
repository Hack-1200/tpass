require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
   test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    # follow_redirect!
    assert_template 'users/new'
    assert_not is_logged_in?
  end
end
