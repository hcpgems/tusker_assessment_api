require 'test_helper'

class ProspectContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prospect_content = prospect_contents(:one)
  end

  test "should get index" do
    get prospect_contents_url, as: :json
    assert_response :success
  end

  test "should create prospect_content" do
    assert_difference('ProspectContent.count') do
      post prospect_contents_url, params: { prospect_content: { content_id: @prospect_content.content_id, prospect_id: @prospect_content.prospect_id } }, as: :json
    end

    assert_response 201
  end

  test "should show prospect_content" do
    get prospect_content_url(@prospect_content), as: :json
    assert_response :success
  end

  test "should update prospect_content" do
    patch prospect_content_url(@prospect_content), params: { prospect_content: { content_id: @prospect_content.content_id, prospect_id: @prospect_content.prospect_id } }, as: :json
    assert_response 200
  end

  test "should destroy prospect_content" do
    assert_difference('ProspectContent.count', -1) do
      delete prospect_content_url(@prospect_content), as: :json
    end

    assert_response 204
  end
end
