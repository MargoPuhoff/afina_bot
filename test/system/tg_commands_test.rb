require "application_system_test_case"

class TgCommandsTest < ApplicationSystemTestCase
  setup do
    @tg_command = tg_commands(:one)
  end

  test "visiting the index" do
    visit tg_commands_url
    assert_selector "h1", text: "Tg commands"
  end

  test "should create tg command" do
    visit tg_commands_url
    click_on "New tg command"

    click_on "Create Tg command"

    assert_text "Tg command was successfully created"
    click_on "Back"
  end

  test "should update Tg command" do
    visit tg_command_url(@tg_command)
    click_on "Edit this tg command", match: :first

    click_on "Update Tg command"

    assert_text "Tg command was successfully updated"
    click_on "Back"
  end

  test "should destroy Tg command" do
    visit tg_command_url(@tg_command)
    click_on "Destroy this tg command", match: :first

    assert_text "Tg command was successfully destroyed"
  end
end
