require "test_helper"

class TgCommandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tg_command = tg_commands(:one)
  end

  test "should get index" do
    get tg_commands_url
    assert_response :success
  end

  test "should get new" do
    get new_tg_command_url
    assert_response :success
  end

  test "should create tg_command" do
    assert_difference("TgCommand.count") do
      post tg_commands_url, params: { tg_command: {} }
    end

    assert_redirected_to tg_command_url(TgCommand.last)
  end

  test "should show tg_command" do
    get tg_command_url(@tg_command)
    assert_response :success
  end

  test "should get edit" do
    get edit_tg_command_url(@tg_command)
    assert_response :success
  end

  test "should update tg_command" do
    patch tg_command_url(@tg_command), params: { tg_command: {} }
    assert_redirected_to tg_command_url(@tg_command)
  end

  test "should destroy tg_command" do
    assert_difference("TgCommand.count", -1) do
      delete tg_command_url(@tg_command)
    end

    assert_redirected_to tg_commands_url
  end
end
