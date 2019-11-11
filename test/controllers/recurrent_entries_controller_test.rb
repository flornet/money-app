require 'test_helper'

class RecurrentEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recurrent_entry = recurrent_entries(:one)
  end

  test "should get index" do
    get recurrent_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_recurrent_entry_url
    assert_response :success
  end

  test "should create recurrent_entry" do
    assert_difference('RecurrentEntry.count') do
      post recurrent_entries_url, params: { recurrent_entry: { account_id: @recurrent_entry.account_id, active: @recurrent_entry.active, category_id: @recurrent_entry.category_id, checked: @recurrent_entry.checked, comment: @recurrent_entry.comment, end_date: @recurrent_entry.end_date, frequency: @recurrent_entry.frequency, start_date: @recurrent_entry.start_date, user_id: @recurrent_entry.user_id, value: @recurrent_entry.value } }
    end

    assert_redirected_to recurrent_entry_url(RecurrentEntry.last)
  end

  test "should show recurrent_entry" do
    get recurrent_entry_url(@recurrent_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_recurrent_entry_url(@recurrent_entry)
    assert_response :success
  end

  test "should update recurrent_entry" do
    patch recurrent_entry_url(@recurrent_entry), params: { recurrent_entry: { account_id: @recurrent_entry.account_id, active: @recurrent_entry.active, category_id: @recurrent_entry.category_id, checked: @recurrent_entry.checked, comment: @recurrent_entry.comment, end_date: @recurrent_entry.end_date, frequency: @recurrent_entry.frequency, start_date: @recurrent_entry.start_date, user_id: @recurrent_entry.user_id, value: @recurrent_entry.value } }
    assert_redirected_to recurrent_entry_url(@recurrent_entry)
  end

  test "should destroy recurrent_entry" do
    assert_difference('RecurrentEntry.count', -1) do
      delete recurrent_entry_url(@recurrent_entry)
    end

    assert_redirected_to recurrent_entries_url
  end
end
