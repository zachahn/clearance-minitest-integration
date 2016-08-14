require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should be able to log in manually" do
    user = FactoryGirl.create(:user, email: "test@example.com", password: "letmein")

    post session_url, params: { session: { email: "test@example.com", password: "letmein" } }

    get root_url

    assert_select("p", "test@example.com")
  end

  test "should be able to log in using `#sign_in_as`" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
  end

  test "should be able to log in using `#sign_in`" do
    sign_in
  end
end
