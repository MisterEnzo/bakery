require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:admin_user)
    @invalid_user = User.create(email: 'admin@test.com', password: 'password')
    MenuItem.create(
                sku: "cccookies",
                name: "Chocolate Chip Cookies",
                description: "A dozen of heavenly crunchy on the outside
                             and chewy on inside goodness. Gluten-Free",
                price_cents: 60000,
                photo_url: 'chocolate-chip.jpg'
                )
    MenuItem.create(
                sku: "brownies",
                name: "Deep Chocolate Brownies",
                description: "Twenty squares of fudgy brownies made of
                              premium dark chocolate. Gluten-Free",
                price_cents: 50000,
                photo_url: 'fudge-brownies.jpg'
                )
    MenuItem.create(
                sku: "cheesecake",
                name: "New York Style Cheesecake",
                description: "A classic, made from premium cream cheese and a
                             crumble crust. Our best-seller. Gluten-free",
                price_cents: 60000,
                photo_url: 'cheesecake.jpg'
                )
  end

  test "login with invalid information and tries to access orders" do
    get new_user_session_path
    assert_template 'sessions/new'
    post user_session_path, params: { user: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get orders_path
    assert_response :redirect
    follow_redirect!
    assert_template 'sessions/new'
  end

  test "login with valid information and tries to access orders" do
    get new_user_session_path
    assert_template 'sessions/new'
    sign_in @user
    get orders_path
    assert_response :success
  end

  test "login and create a new order" do
    get new_user_session_path
    assert_template 'sessions/new'
    sign_in @user
    assert_difference 'Order.count', 1 do
      post orders_path
    end
    follow_redirect!
    assert_template 'order_details/new'
    # I'm having trouble with my Menu Items in the test. I still need to figure it out in order to complete the entire order-payment sequence.
    # assert_difference 'OrderDetail.count', 3 do
    #   post order_order_details_path, params: { details: { cookies_q: "1", brownies_q: "1", cakes_q: "1" }, order_id: Order.last.id.to_s }
    # end
  end
end
