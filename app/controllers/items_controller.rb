class ItemsController < ApplicationController

  def index
    @items = Item.all
    @images = ItemImage.all
    @item = Item.new
    parent_id = params[:parent_id]
    @children = Category.find_by(parent_id).children
  end

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

     # 親カテゴリーが選択された後に動くアクション
  def category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find(params[:parent_id]).children # 親カテゴリのidに紐づく子カテゴリを格納
  end
  
   # 子カテゴリーが選択された後に動くアクション
   def category_grandchildren
      @category_grandchildren = Category.find(params[:child_id]).children
   end

   def list_from_category
      @categorysNAME = []
      @items = []
      over_categoryIDs = Category.find(params[:id]).path_ids # 選択されたカテゴリーの自分と先祖のidを全て取得
        over_categoryIDs.each do |categoryID|
          @categorysNAME << Category.find(categoryID).name
          # 選択されたカテゴリーと親のnameを格納
        end
      under_category = Category.find(params[:id]).subtree
      # 自己と子供のカテゴリーを格納
        under_category.each do |category|
          item = category.items
          @items.push(item)
        end
      @items.flatten!
      # 配列の平坦化
   end

  private
  def item_params
    params.require(:item).permit(:name, :description_item, :brand_id, :category_id, :condition_id, :shipping_charger_id, :shipping_method_id, :ship_from_id, :shipping_days_id, :price, :sales_profit, item_images_attributes: {image: []})
  end

end

