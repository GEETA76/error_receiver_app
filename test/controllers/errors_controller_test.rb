require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @error = errors(:one)
  end

  test "should get index" do
    get errors_url
    assert_response :success
  end

  test "should get new" do
    get new_error_url
    assert_response :success
  end

  test "should create error" do
    assert_difference("Error.count") do
      post errors_url, params: { error: { backtrace: @error.backtrace, error_class: @error.error_class, message: @error.message, method: @error.method, path: @error.path, timestamp: @error.timestamp } }
    end

    assert_redirected_to error_url(Error.last)
  end

  test "should show error" do
    get error_url(@error)
    assert_response :success
  end

  test "should get edit" do
    get edit_error_url(@error)
    assert_response :success
  end

  test "should update error" do
    patch error_url(@error), params: { error: { backtrace: @error.backtrace, error_class: @error.error_class, message: @error.message, method: @error.method, path: @error.path, timestamp: @error.timestamp } }
    assert_redirected_to error_url(@error)
  end

  test "should destroy error" do
    assert_difference("Error.count", -1) do
      delete error_url(@error)
    end

    assert_redirected_to errors_url
  end
end
