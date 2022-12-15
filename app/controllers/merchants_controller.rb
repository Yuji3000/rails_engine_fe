require 'faraday'
class MerchantsController < ApplicationController
  def index
    @merchants = MerchantsService.new.all
  end

  def show
    @merchant = MerchantsService.new.search(params[:id])
    @items = MerchantsService.new.items(params[:id])
  end
end