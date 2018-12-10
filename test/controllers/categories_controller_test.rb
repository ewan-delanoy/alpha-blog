require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "sports")
    @admin_user = User.create({username: "admin", email: "admin@example.com", password:"password", admin: true})
  end
  test "should get categories index" do
    get categories_path
    assert_response :success
  end
  test "should get new category action" do
    sign_in_as(@admin_user,"password")
    get new_category_path
    assert_response :success
  end
  test "should get show category action" do
    get category_path(@category)
    assert_response :success
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: {category:{name:"sports"}}
    end
    assert_redirected_to categories_path
  end
end
