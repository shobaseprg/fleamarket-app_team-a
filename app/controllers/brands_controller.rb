class BrandsController < ApplicationController
  def index
    @items1 = Item.where(brand_id:1).order("id DESC").last(10)
    @items2 = Item.where(brand_id:2).order("id DESC").last(10)
    @items3 = Item.where(brand_id:3).order("id DESC").last(10)
    @items4 = Item.where(brand_id:4).order("id DESC").last(10)
    @items5 = Item.where(brand_id:5).order("id DESC").last(10)
  end

  def list
    @brandsNAME = []
    @items = Item.where(brand_id: params[:id]).order("id DESC")
    @brandsNAME << Brand.find(params[:id]).name
  end

end