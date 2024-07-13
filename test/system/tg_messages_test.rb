require "application_system_test_case"

class TgMessagesTest < ApplicationSystemTestCase
  setup do
    @tg_message = tg_messages(:one)
  end

  test "visiting the index" do
    visit tg_messages_url
    assert_selector "h1", text: "Tg messages"
  end

  test "should create tg message" do
    visit tg_messages_url
    click_on "New tg message"

    click_on "Create Tg message"

    assert_text "Tg message was successfully created"
    click_on "Back"
  end

  test "should update Tg message" do
    visit tg_message_url(@tg_message)
    click_on "Edit this tg message", match: :first

    click_on "Update Tg message"

    assert_text "Tg message was successfully updated"
    click_on "Back"
  end

  test "should destroy Tg message" do
    visit tg_message_url(@tg_message)
    click_on "Destroy this tg message", match: :first

    assert_text "Tg message was successfully destroyed"
  end
end
