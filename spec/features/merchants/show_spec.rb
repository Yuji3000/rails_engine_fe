require "rails_helper"

RSpec.describe 'Merchant index page' do
  before :each do
    json_response = File.read('spec/fixtures/merchants.json')
    json_response2 = File.read('spec/fixtures/merchant.json')
    json_response3 = File.read('spec/fixtures/items.json')

    stub_request(:get, "http://localhost:3000/api/v1/merchants").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.2'
      }).
    to_return(status: 200, body: json_response, headers: {})

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
  end

  it "shows all merchants on the index page" do
    
    visit "/merchants"

    expect(page).to have_content("Okuneva, Prohaska and Rolfson")
    expect(page).to have_link("Parisian Group")

    click_on "Parisian Group"

    expect(current_path).to eq("/merchants/57")

    expect(page).to have_content("Parisian Group")  
    expect(page).to have_content("Item Consectetur Id")
    expect(page).to have_link("Item Consectetur Id")
  end
end