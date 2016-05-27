require 'test_helper'

class MultimediaPostsControllerTest < ActionController::TestCase
  setup do
    @multimedia_post = multimedia_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:multimedia_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create multimedia_post" do
    assert_difference('MultimediaPost.count') do
      post :create, multimedia_post: { title: @multimedia_post.title }
    end

    assert_redirected_to multimedia_post_path(assigns(:multimedia_post))
  end

  test "should show multimedia_post" do
    get :show, id: @multimedia_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @multimedia_post
    assert_response :success
  end

  test "should update multimedia_post" do
    patch :update, id: @multimedia_post, multimedia_post: { title: @multimedia_post.title }
    assert_redirected_to multimedia_post_path(assigns(:multimedia_post))
  end

  test "should destroy multimedia_post" do
    assert_difference('MultimediaPost.count', -1) do
      delete :destroy, id: @multimedia_post
    end

    assert_redirected_to multimedia_posts_path
  end
end
