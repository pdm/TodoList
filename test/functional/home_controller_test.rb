require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  context "GET :index" do
    should "send response 200" do
      get :index
      assert_response 200
    end
  end
end
