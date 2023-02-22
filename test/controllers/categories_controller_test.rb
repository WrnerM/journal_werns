require 'test_helper'

class CategoryControllerTest < ActionDispatch::IntegrationTest

    setup do
        @category = categories(:one)
    
        get '/users/sign_in'
        sign_in users(:user_001)
        post user_session_url
    end    

    test "should get index" do
        get categories_path
        assert_response :success
    end

    test "should get new" do
        get new_category_path
        assert_response :success
    end

    test "should show category" do
        get category_url(@category)
        assert_response :success
      end

    test "should get edit" do
        get edit_category_url(@category)
        assert_response :success
    end

    test "should create category" do
        assert_difference("Category.count") do
          post categories_url, params: { category: { name: @category.name } }
        end
    end

    test "should delete category" do
        assert_difference("Category.count", -1) do
            delete category_url(@category)
        end
    end
end