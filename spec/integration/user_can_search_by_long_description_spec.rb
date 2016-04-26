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
