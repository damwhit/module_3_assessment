require "rails_helper"

RSpec.describe "GET api/v1/items" do
  it "returns all items" do
    item1 = create(:item)
    item2 = create(:item, name: "new")
    create(:item, name: "thing")

    get "/api/v1/items"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(3)

    json_body1 = json_body[0]
    expect(json_body1[:name]).to eq(
      item1.name,
      )

    delete "/api/v1/items/#{item1.id}"

    expect(response.status).to eq(204)

    get "/api/v1/items"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(2)

    json_body1 = json_body[0]
    expect(json_body1[:name]).to eq(
        item2.name
      )

  end
end
