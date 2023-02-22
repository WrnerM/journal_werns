require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @category = categories(:one)
    @task = tasks(:one)

    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test "should get index" do
    get category_tasks_path(@category)
    assert_response :success
  end

  test "should get new task" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should get edit of task" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test "should update task" do
    put category_task_path(@category, @task), params:{ task: tasks(:two).attributes}
    assert_response :redirect
  end
end
