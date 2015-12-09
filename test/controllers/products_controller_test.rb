require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { bottle_size: @product.bottle_size, company: @product.company, country: @product.country, description: @product.description, grape_type: @product.grape_type, image_url: @product.image_url, price: @product.price, suit_vegetarian: @product.suit_vegetarian, title: @product.title }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { bottle_size: @product.bottle_size, company: @product.company, country: @product.country, description: @product.description, grape_type: @product.grape_type, image_url: @product.image_url, price: @product.price, suit_vegetarian: @product.suit_vegetarian, title: @product.title }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
