require "application_system_test_case"

class TgChatsTest < ApplicationSystemTestCase
  setup do
    @tg_chat = tg_chats(:one)
  end

  test "visiting the index" do
    visit tg_chats_url
    assert_selector "h1", text: "Tg chats"
  end

  test "should create tg chat" do
    visit tg_chats_url
    click_on "New tg chat"

    click_on "Create Tg chat"

    assert_text "Tg chat was successfully created"
    click_on "Back"
  end

  test "should update Tg chat" do
    visit tg_chat_url(@tg_chat)
    click_on "Edit this tg chat", match: :first

    click_on "Update Tg chat"

    assert_text "Tg chat was successfully updated"
    click_on "Back"
  end

  test "should destroy Tg chat" do
    visit tg_chat_url(@tg_chat)
    click_on "Destroy this tg chat", match: :first

    assert_text "Tg chat was successfully destroyed"
  end
end
