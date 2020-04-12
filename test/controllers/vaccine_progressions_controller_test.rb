require 'test_helper'

class VaccineProgressionsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get vaccine_progressions_update_url
    assert_response :success
  end

end
