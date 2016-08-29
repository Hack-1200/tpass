require 'test_helper'

class MainPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
    assert_select "title","Test Password"
  end

end
