require 'test_helper'

class CommunicationPostsControllerTest < ActionController::TestCase
  setup do
    @communication_post = communication_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:communication_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create communication_post" do
    assert_difference('CommunicationPost.count') do
      post :create, communication_post: {  }
    end

    assert_redirected_to communication_post_path(assigns(:communication_post))
  end

  test "should show communication_post" do
    get :show, id: @communication_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @communication_post
    assert_response :success
  end

  test "should update communication_post" do
    patch :update, id: @communication_post, communication_post: {  }
    assert_redirected_to communication_post_path(assigns(:communication_post))
  end

  test "should destroy communication_post" do
    assert_difference('CommunicationPost.count', -1) do
      delete :destroy, id: @communication_post
    end

    assert_redirected_to communication_posts_path
  end
end
