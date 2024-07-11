require "application_system_test_case"

class TgUsersTest < ApplicationSystemTestCase
  setup do
    @tg_user = tg_users(:one)
  end

  test "visiting the index" do
    visit tg_users_url
    assert_selector "h1", text: "Tg users"
  end

  test "should create tg user" do
    visit tg_users_url
    click_on "New tg user"

    click_on "Create Tg user"

    assert_text "Tg user was successfully created"
    click_on "Back"
  end

  test "should update Tg user" do
    visit tg_user_url(@tg_user)
    click_on "Edit this tg user", match: :first

    click_on "Update Tg user"

    assert_text "Tg user was successfully updated"
    click_on "Back"
  end

  test "should destroy Tg user" do
    visit tg_user_url(@tg_user)
    click_on "Destroy this tg user", match: :first

    assert_text "Tg user was successfully destroyed"
  end
end
