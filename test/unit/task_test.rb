require 'test_helper'

class TaskTest < ActiveSupport::TestCase
    context "Task validations" do
      setup do
        @task = FactoryGirl.create(:task, :content => "fly a kite")
      end
      should "capitalize content" do
        assert_equal "Fly a kite", @task.content
      end
      should validate_presence_of :content
    end

    context "Task functions" do
      # TODO: can use Delorean to time travel for testing
      setup do
        @task1 = FactoryGirl.create(:task, :content => "Fly a kite", :created_at => Time.now)
        @task2 = FactoryGirl.create(:task, :content => "Go fishing", :created_at => Time.now - 2.hours)
        @task3 = FactoryGirl.create(:task, :content => "Watch Monk", :created_at => Time.now - 3.hours)
      end
      should "get old tasks: created before the last hour" do
        assert_same_elements [@task2, @task3], Task.old_tasks
      end
    end
end
