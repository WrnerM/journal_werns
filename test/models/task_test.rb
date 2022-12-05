require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save Task without name" do
    task = Task.new
    assert_not task.save, "Saved Task without a name"
  end

end
