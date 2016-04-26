require "rails_helper"

RSpec.describe "GET api/v1/items" do
  it "returns all items" do
    item1 = create(:item)
    create(:item, name: "new")
    create(:item, name: "thing")

    get "/api/v1/items/#{item1.id}"

    expect(response.status).to eq(200)
    expect(json_body.count).to eq(6)


    expect(json_body).to eq({
      id: item1.id,
      name: item1.name,
      description: item1.description,
      image_url: item1.image_url,
      created_at: format_date(item1.created_at),
      updated_at: format_date(item1.updated_at),
      })
  end
end
