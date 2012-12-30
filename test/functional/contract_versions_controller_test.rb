require 'test_helper'

class ContractVersionsControllerTest < ActionController::TestCase
  setup do
    @contract_version = contract_versions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contract_versions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract_version" do
    assert_difference('ContractVersion.count') do
      post :create, contract_version: { duration_months: @contract_version.duration_months, duration_years: @contract_version.duration_years, interest_rate: @contract_version.interest_rate, start: @contract_version.start, version: @contract_version.version }
    end

    assert_redirected_to contract_version_path(assigns(:contract_version))
  end

  test "should show contract_version" do
    get :show, id: @contract_version
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract_version
    assert_response :success
  end

  test "should update contract_version" do
    put :update, id: @contract_version, contract_version: { duration_months: @contract_version.duration_months, duration_years: @contract_version.duration_years, interest_rate: @contract_version.interest_rate, start: @contract_version.start, version: @contract_version.version }
    assert_redirected_to contract_version_path(assigns(:contract_version))
  end

  test "should destroy contract_version" do
    assert_difference('ContractVersion.count', -1) do
      delete :destroy, id: @contract_version
    end

    assert_redirected_to contract_versions_path
  end
end
