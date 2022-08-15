require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get posts_search_url
    assert_response :success
  end
end
