require "test_helper"

class TgMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tg_message = tg_messages(:one)
  end

  test "should get index" do
    get tg_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_tg_message_url
    assert_response :success
  end

  test "should create tg_message" do
    assert_difference("TgMessage.count") do
      post tg_messages_url, params: { tg_message: {  } }
    end

    assert_redirected_to tg_message_url(TgMessage.last)
  end

  test "should show tg_message" do
    get tg_message_url(@tg_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_tg_message_url(@tg_message)
    assert_response :success
  end

  test "should update tg_message" do
    patch tg_message_url(@tg_message), params: { tg_message: {  } }
    assert_redirected_to tg_message_url(@tg_message)
  end

  test "should destroy tg_message" do
    assert_difference("TgMessage.count", -1) do
      delete tg_message_url(@tg_message)
    end

    assert_redirected_to tg_messages_url
  end
end
