require "application_system_test_case"

class RecurrentEntriesTest < ApplicationSystemTestCase
  setup do
    @recurrent_entry = recurrent_entries(:one)
  end

  test "visiting the index" do
    visit recurrent_entries_url
    assert_selector "h1", text: "Recurrent Entries"
  end

  test "creating a Recurrent entry" do
    visit recurrent_entries_url
    click_on "New Recurrent Entry"

    fill_in "Account", with: @recurrent_entry.account_id
    check "Active" if @recurrent_entry.active
    fill_in "Category", with: @recurrent_entry.category_id
    check "Checked" if @recurrent_entry.checked
    fill_in "Comment", with: @recurrent_entry.comment
    fill_in "End date", with: @recurrent_entry.end_date
    fill_in "Frequency", with: @recurrent_entry.frequency
    fill_in "Start date", with: @recurrent_entry.start_date
    fill_in "User", with: @recurrent_entry.user_id
    fill_in "Value", with: @recurrent_entry.value
    click_on "Create Recurrent entry"

    assert_text "Recurrent entry was successfully created"
    click_on "Back"
  end

  test "updating a Recurrent entry" do
    visit recurrent_entries_url
    click_on "Edit", match: :first

    fill_in "Account", with: @recurrent_entry.account_id
    check "Active" if @recurrent_entry.active
    fill_in "Category", with: @recurrent_entry.category_id
    check "Checked" if @recurrent_entry.checked
    fill_in "Comment", with: @recurrent_entry.comment
    fill_in "End date", with: @recurrent_entry.end_date
    fill_in "Frequency", with: @recurrent_entry.frequency
    fill_in "Start date", with: @recurrent_entry.start_date
    fill_in "User", with: @recurrent_entry.user_id
    fill_in "Value", with: @recurrent_entry.value
    click_on "Update Recurrent entry"

    assert_text "Recurrent entry was successfully updated"
    click_on "Back"
  end

  test "destroying a Recurrent entry" do
    visit recurrent_entries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recurrent entry was successfully destroyed"
  end
end
