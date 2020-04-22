class BrandsController < ApplicationController
  def index
    @chanel = Item.where(brand_id:1).order("id DESC").last(10)
    @nike = Item.where(brand_id:2).order("id DESC").last(10)
    @louisvuitton= Item.where(brand_id:3).order("id DESC").last(10)
    @supreme = Item.where(brand_id:4).order("id DESC").last(10)
    @adidas = Item.where(brand_id:5).order("id DESC").last(10)
  end

  def show
    @brandsNAME = []
    @items = Item.where(brand_id: params[:id]).order("id DESC").page(params[:page]).per(100)
    @brandsNAME << Brand.find(params[:id]).name
  end

end