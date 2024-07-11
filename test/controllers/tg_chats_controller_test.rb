require "test_helper"

class TgChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tg_chat = tg_chats(:one)
  end

  test "should get index" do
    get tg_chats_url
    assert_response :success
  end

  test "should get new" do
    get new_tg_chat_url
    assert_response :success
  end

  test "should create tg_chat" do
    assert_difference("TgChat.count") do
      post tg_chats_url, params: { tg_chat: {  } }
    end

    assert_redirected_to tg_chat_url(TgChat.last)
  end

  test "should show tg_chat" do
    get tg_chat_url(@tg_chat)
    assert_response :success
  end

  test "should get edit" do
    get edit_tg_chat_url(@tg_chat)
    assert_response :success
  end

  test "should update tg_chat" do
    patch tg_chat_url(@tg_chat), params: { tg_chat: {  } }
    assert_redirected_to tg_chat_url(@tg_chat)
  end

  test "should destroy tg_chat" do
    assert_difference("TgChat.count", -1) do
      delete tg_chat_url(@tg_chat)
    end

    assert_redirected_to tg_chats_url
  end
end
