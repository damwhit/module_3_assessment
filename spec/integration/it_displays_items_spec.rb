require 'rails_helper'

RSpec.feature "it sees all items" do
  it "sees all of the items" do
    visit '/'

    expect(page.status_code).to eq(200)

    within('h1') do
      expect(page).to have_content('Items')
    end
  end
end
