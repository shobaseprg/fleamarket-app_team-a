class ItemsController < ApplicationController

  def index

  end

  def new
    @item = Item.new
    # @item.item_images.new
    1.times { @item.item_images.build }
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

     # 親カテゴリーが選択された後に動くアクション
  def category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find(params[:parent_id]).children
  end
  
   # 子カテゴリーが選択された後に動くアクション
   def category_grandchildren
      @category_grandchildren = Category.find(params[:child_id]).children
   end

  private
  def item_params
    params.require(:item).permit(:name, :description_item, :brand_id, :category_id, :condition_id, :shipping_charger_id, :shipping_method_id, :ship_from_id, :shipping_days_id, :price, :sales_profit, item_images_attributes: {image: []})
  end

end

