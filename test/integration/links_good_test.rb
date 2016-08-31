require 'test_helper'

class LinksGoodTest < ActionDispatch::IntegrationTest
  test "All links must be right" do
  	get root_path
  	assert_template "main_pages/index"
  	assert_select "a[href=?]", root_path
  	assert_select "a[href=?]", new_path
  end
end
