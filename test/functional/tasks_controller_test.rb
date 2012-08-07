require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  context "GET /tasks.json" do
    should "get index" do
      get :index, :format => :json
      assert_response 200
    end
  end

  context "POST /accounts.json" do
    setup do
      @task = FactoryGirl.create(:task)
    end
    should "create a task" do
      assert_difference('Task.count') do
        post :create, :task => @task.attributes, :format => :json
      end
      assert_not_nil Task.find @task.id
    end
    should "get response" do
      post :create, :task => @task.attributes, :format => :json
      assert_response 201
    end
  end

  context "DELETE /tasks/1.json" do
    setup do
      @task = FactoryGirl.create(:task)
      delete :destroy, :id => @task, :format => :json
    end
    should "destroy task" do
      assert_nil Task.find_by_id @task.id
      assert_response 204
    end
  end
end
