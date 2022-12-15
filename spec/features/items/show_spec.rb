require "rails_helper"

RSpec.describe 'Item show page' do
  before :each do
    # json_response = File.read('spec/fixtures/merchants.json')
    json_response2 = File.read('spec/fixtures/merchant.json')
    json_response3 = File.read('spec/fixtures/items.json')
    json_response4 = File.read('spec/fixtures/item.json')

    # stub_request(:get, "http://localhost:3000/api/v1/merchants").
    # with(
    #   headers: {
    #  'Accept'=>'*/*',
    #  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    #  'User-Agent'=>'Faraday v2.7.2'
    #   }).
    # to_return(status: 200, body: json_response, headers: {})

    stub_request(:get, "http://localhost:3000/api/v1/merchants/57").
      with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.2'
        }).
      to_return(status: 200, body: json_response2, headers: {})
    
    stub_request(:get, "http://localhost:3000/api/v1/merchants/57/items").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.2'
           }).
         to_return(status: 200, body: json_response3, headers: {})

    stub_request(:get, "http://localhost:3000/api/v1/items/1248").
      with(
        headers: {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.2'
        }).
      to_return(status: 200, body: json_response4, headers: {})
  end

  it "item show" do
    
    visit "/merchants/57"

    expect(page).to have_content("Item Consectetur Id")
    expect(page).to have_link("Item Consectetur Id")
    
    click_on "Item Consectetur Id"
    
    expect(current_path).to eq("/items/1248")
    expect(page).to have_content("name: Item Consectetur Id")
    expect(page).to have_content("description: Minima ducimus consequatur error dignissimos nisi et ea. Voluptatem quae quia est velit at ut iste. Sit consequatur eius ratione.")
    expect(page).to have_content("unit_price: 983.24")
  end
end