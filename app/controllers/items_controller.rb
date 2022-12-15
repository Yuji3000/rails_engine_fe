class ItemsController < ApplicationController
  def show
    @item = MerchantsService.new.item(params[:id])
    # require 'pry'; binding.pry
  end
end