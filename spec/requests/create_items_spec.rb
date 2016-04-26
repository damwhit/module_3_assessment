require "rails_helper"

RSpec.describe "GET api/v1/items" do
  it "returns all items" do
    item1 = create(:item)
    create(:item, name: "new")
    create(:item, name: "thing")

    post '/api/v1/items?name=waffle&description=guud&image_url=picture'

    expect(response.status).to eq(201)
    expect(json_body.count).to eq(6)

    get 'api/v1/items'

    expect(json_body.count).to eq(4)
    json_body4 = json_body[3]

    expect(json_body4[:name]).to eq("waffle")
    expect(json_body4[:description]).to eq("guud")
    expect(json_body4[:image_url]).to eq("picture")

  end
end
