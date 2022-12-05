require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    test "should not save Category without name" do
        category = Category.new
        assert_not category.save, "Saved Category without a name"
    end

    test "should not save Category name with less than 5 characters" do
        category = Category.new

        category.name = "yow"
        assert_not category.save, "saved Category with less than 5 characters"
    end
end