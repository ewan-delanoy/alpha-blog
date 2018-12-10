require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "sports")
  end
  test "get new category form and create category" do
    get new_category_path
    assert_response :success
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, params: {category:{name:"sports"}}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'sports', response.body
  end

  test "invalid category submission results in failure" do
    get new_category_path
    assert_response :success
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, params: {category:{name:" "}}
      follow_redirect!
    end
    assert_template 'categories/new'
    assert_template 'div.panel-body'

  end
end
