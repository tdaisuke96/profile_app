require 'test_helper'

class ProfilePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get profile_edit" do
    get profile_pages_profile_edit_url
    assert_response :success
  end

  test "should get skill_edit" do
    get profile_pages_skill_edit_url
    assert_response :success
  end

end
