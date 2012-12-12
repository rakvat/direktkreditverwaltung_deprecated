require 'test_helper'

class AccountingEntriesControllerTest < ActionController::TestCase
  setup do
    @accounting_entry = accounting_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_entry" do
    assert_difference('AccountingEntry.count') do
      post :create, accounting_entry: { amount: @accounting_entry.amount, date: @accounting_entry.date, process: @accounting_entry.process }
    end

    assert_redirected_to accounting_entry_path(assigns(:accounting_entry))
  end

  test "should show accounting_entry" do
    get :show, id: @accounting_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_entry
    assert_response :success
  end

  test "should update accounting_entry" do
    put :update, id: @accounting_entry, accounting_entry: { amount: @accounting_entry.amount, date: @accounting_entry.date, process: @accounting_entry.process }
    assert_redirected_to accounting_entry_path(assigns(:accounting_entry))
  end

  test "should destroy accounting_entry" do
    assert_difference('AccountingEntry.count', -1) do
      delete :destroy, id: @accounting_entry
    end

    assert_redirected_to accounting_entries_path
  end
end
