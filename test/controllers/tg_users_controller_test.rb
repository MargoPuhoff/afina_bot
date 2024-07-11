require "test_helper"

class TgUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tg_user = tg_users(:one)
  end

  test "should get index" do
    get tg_users_url
    assert_response :success
  end

  test "should get new" do
    get new_tg_user_url
    assert_response :success
  end

  test "should create tg_user" do
    assert_difference("TgUser.count") do
      post tg_users_url, params: { tg_user: {  } }
    end

    assert_redirected_to tg_user_url(TgUser.last)
  end

  test "should show tg_user" do
    get tg_user_url(@tg_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_tg_user_url(@tg_user)
    assert_response :success
  end

  test "should update tg_user" do
    patch tg_user_url(@tg_user), params: { tg_user: {  } }
    assert_redirected_to tg_user_url(@tg_user)
  end

  test "should destroy tg_user" do
    assert_difference("TgUser.count", -1) do
      delete tg_user_url(@tg_user)
    end

    assert_redirected_to tg_users_url
  end
end
