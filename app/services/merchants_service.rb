require 'pry'
require 'faraday'

class MerchantsService
  def all
    conn = Faraday.new(url: 'http://localhost:3000/api/v1/') 
   
    response = conn.get("merchants")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def search(input)
    conn = Faraday.new(url: 'http://localhost:3000/api/v1/') 
   
    response = conn.get("merchants/#{input}")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def items(input)
    conn = Faraday.new(url: 'http://localhost:3000/api/v1/') 
   
    response = conn.get("merchants/#{input}/items")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  def item(input)
    conn = Faraday.new(url: 'http://localhost:3000/api/v1/') 
   
    response = conn.get("items/#{input}")

    json = JSON.parse(response.body, symbolize_names: true)
  end
end