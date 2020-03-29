class ItemsController < ApplicationController
  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      flash[:notice] = "出品が完了しました"
      redirect_to root_path
    else
      flash[:alert] = '出品に失敗しました。必須項目を確認してください。'
      redirect_to new_item_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description_item, :condition_id, :shipping_charger_id, :shipping_method_id, :ship_from_id, :shipping_days_id, :price, :sales_profit, item_images_attributes: [:image])

    
  end
end
