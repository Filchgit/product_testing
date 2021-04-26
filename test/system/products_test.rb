require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase

   test "visiting the index" do
    visit root_url
    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: Product.count
  end

  test "lets a signed in user create a new product" do
  login_as users(:sheila)
  byebug
  visit "/products/new"
  #save_and_open_screenshot

  fill_in "product_name", with: "Le Wagon"
  fill_in "product_tagline", with: "Change your life: Learn to code"
  # save_and_open_screenshot

  click_on 'Create Product'
  # save_and_open_screenshot

  # Should be redirected to Home with new product
  assert_equal root_path, page.current_path
  assert_text "Change your life: Learn to code"
end

  test " visiting the calculate page" do
    login_as users(:sheila)
    visit "/products/calculate"
    assert_selector "h2", text: "This is where I want to check some calculations maybe?"
    assert_selector "p", text: "Skello $17"
    assert_equal(17, (Product.find_by name: "Skello").wholesale_cost/100)
end

end
