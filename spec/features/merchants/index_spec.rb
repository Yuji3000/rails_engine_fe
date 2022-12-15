require "rails_helper"

RSpec.describe 'Merchant index page' do
  before :each do
    json_response = File.read('spec/fixtures/merchants.json')

    stub_request(:get, "http://localhost:3000/api/v1/merchants").
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'User-Agent'=>'Faraday v2.7.2'
      }).
    to_return(status: 200, body: json_response, headers: {})
  end

  it "shows all merchants on the index page" do
    visit "/merchants"

    expect(page).to have_content("Okuneva, Prohaska and Rolfson")
    expect(page).to have_link("Parisian Group")
  end
end