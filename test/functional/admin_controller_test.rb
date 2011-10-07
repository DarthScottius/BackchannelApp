require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  fixtures :users

  test "index without user" do
    get :index
    assert_redirected_to login_url
    assert_equal "Please log in", flash[:notice]
  end


  test "index with user" do
    get :index, {}, {:user_id =>users(:one).id}
    assert_response :success
  end

end
