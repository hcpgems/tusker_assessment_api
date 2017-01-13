require 'test_helper'

class ProspectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prospect = prospects(:one)
  end

  test "should get index" do
    get prospects_url, as: :json
    assert_response :success
  end

  test "should create prospect" do
    assert_difference('Prospect.count') do
      post prospects_url, params: { prospect: { city_id: @prospect.city_id, contact: @prospect.contact } }, as: :json
    end

    assert_response 201
  end

  test "should show prospect" do
    get prospect_url(@prospect), as: :json
    assert_response :success
  end

  test "should update prospect" do
    patch prospect_url(@prospect), params: { prospect: { city_id: @prospect.city_id, contact: @prospect.contact } }, as: :json
    assert_response 200
  end

  test "should destroy prospect" do
    assert_difference('Prospect.count', -1) do
      delete prospect_url(@prospect), as: :json
    end

    assert_response 204
  end
end
