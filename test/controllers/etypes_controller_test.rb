require 'test_helper'

class EtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @etype = etypes(:one)
  end

  test "should get index" do
    get etypes_url
    assert_response :success
  end

  test "should get new" do
    get new_etype_url
    assert_response :success
  end

  test "should create etype" do
    assert_difference('Etype.count') do
      post etypes_url, params: { etype: { name: @etype.name } }
    end

    assert_redirected_to etype_url(Etype.last)
  end

  test "should show etype" do
    get etype_url(@etype)
    assert_response :success
  end

  test "should get edit" do
    get edit_etype_url(@etype)
    assert_response :success
  end

  test "should update etype" do
    patch etype_url(@etype), params: { etype: { name: @etype.name } }
    assert_redirected_to etype_url(@etype)
  end

  test "should destroy etype" do
    assert_difference('Etype.count', -1) do
      delete etype_url(@etype)
    end

    assert_redirected_to etypes_url
  end
end
