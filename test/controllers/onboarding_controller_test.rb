require "test_helper"

class OnboardingControllerTest < ActionDispatch::IntegrationTest
  test "should get complete" do
    get onboarding_complete_url
    assert_response :success
  end
end
