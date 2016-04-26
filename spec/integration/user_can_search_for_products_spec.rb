 # As a user
# When I visit the "/"
# And I fill in the search box with "sennheiser" and click "search"
# Then my current path should be "/search"
# And I should see exactly 15 results
# And each result should contain sku, name, customer average review, short description, sale price, and image ONLY

require 'rails_helper'

RSpec.feature "user can search for products" do
  context "they only want to see the top 15 from search" do
    VCR.use_cassette("products_search") do
      it "returns the top 15 results" do
        visit '/'

        fill_in 'product', with: "sennheiser"
        click_on 'search'

        expect(current_path).to eq('/search')

        expect(Product.count).to eq(15)

        expect(page).to have_content('sennheiser')

      end
    end
  end
end
