class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "出品が完了しました"
      redirect_to root_path
    else
      flash[:alert] = '出品に失敗しました。必須項目を確認してください。'
      redirect_to new_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description_item, :category_id, :brand_id, :condition, :shipping_charger, :shipping_method, :ship_from, :shipping_days, :price, :sales_profit, images_attributes: [:image])
  end

end

