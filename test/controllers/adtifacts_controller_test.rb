require 'test_helper'

class AdtifactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adtifact = adtifacts(:one)
  end

  test "should get index" do
    get adtifacts_url
    assert_response :success
  end

  test "should get new" do
    get new_adtifact_url
    assert_response :success
  end

  test "should create adtifact" do
    assert_difference('Adtifact.count') do
      post adtifacts_url, params: { adtifact: { key: @adtifact.key, name: @adtifact.name, project_id: @adtifact.project_id } }
    end

    assert_redirected_to adtifact_url(Adtifact.last)
  end

  test "should show adtifact" do
    get adtifact_url(@adtifact)
    assert_response :success
  end

  test "should get edit" do
    get edit_adtifact_url(@adtifact)
    assert_response :success
  end

  test "should update adtifact" do
    patch adtifact_url(@adtifact), params: { adtifact: { key: @adtifact.key, name: @adtifact.name, project_id: @adtifact.project_id } }
    assert_redirected_to adtifact_url(@adtifact)
  end

  test "should destroy adtifact" do
    assert_difference('Adtifact.count', -1) do
      delete adtifact_url(@adtifact)
    end

    assert_redirected_to adtifacts_url
  end
end
