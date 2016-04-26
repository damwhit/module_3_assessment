require 'rails_helper'

RSpec.feature "user can search for products" do
  context "they only want to see the top 15 from search" do
    VCR.use_cassette("products_search") do
      it "returns the top 15 results" do
        visit '/'

        fill_in 'product', with: "sennheiser"
        click_on 'search'

        expect(current_path).to eq('/search')

        expect(page).to have_content('product name: Galaxy Audio - Headset Microphone - Beige')

      end
    end
  end
end
