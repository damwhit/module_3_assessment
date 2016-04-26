# As a user
# When I visit the "/"
# And I fill in the search box with "sennheiser headphones white" and click "search"
# Then my current path should be "/search"
# And I should see limited results (at the time of writing, 3. SKUs: 9068155, 9068004, 9068128)
# And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
# ​
# * The search should hit `https://api.bestbuy.com/v1/products` and results should be filtered on their `longDescription`. The search should return any product with the search term included.
# * Display the returned products and their attributes returned from the API query in a logical and intuitive html layout. (This does not need to be overly styled).
# * If the search yields no result, have an effective UI in place to inform the user.
require 'rails_helper'

RSpec.feature "user can search for products by long description" do
  context "they only see the results that match the long description" do
    it "returns only the correct results" do
      visit '/'

      fill_in 'product', with: "sennheiser headphones white"
      click_on 'search'

      expect(current_path).to eq('/search')

      expect(page).to have_content('product name: Sennheiser - CX 2.00G Earbud Headphones - White')
    end
  end
end
