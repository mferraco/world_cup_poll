require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { access_token: @user.access_token, email: @user.email, expires: @user.expires, first_name: @user.first_name, last_name: @user.last_name, phone: @user.phone, refresh_token: @user.refresh_token, role: @user.role, uid: @user.uid }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { access_token: @user.access_token, email: @user.email, expires: @user.expires, first_name: @user.first_name, last_name: @user.last_name, phone: @user.phone, refresh_token: @user.refresh_token, role: @user.role, uid: @user.uid }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
