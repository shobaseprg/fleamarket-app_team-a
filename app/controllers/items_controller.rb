class ItemsController < ApplicationController
  before_action :set_current_user_items,only:[:i_OnSale,:i_trading,:i_SoldOut]
  before_action :set_user,only:[:i_OnSale,:i_trading,:i_SoldOut]

  def i_OnSale #出品中のアクション

  end

  def i_trading  #取引中のアクション

  end

  def i_SoldOut    #売却済みのアクション

  end


  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    @item.sales_fee = @item.price / 10 
    @item.sales_profit = @item.price - @item.sales_fee
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


  def set_current_user_items
    if user_signed_in? 
      @items = current_user.items.includes(:seller,:buyer,:auction,:item_images)
    else
      redirect_to new_user_session_path
    end
  end


  def item_params
    params.require(:item).permit(:name, :description_item, :brand_id, :category_id, :condition_id, :shipping_charger_id, :shipping_method_id, :ship_from_id, :shipping_days_id, :price, :sales_profit, item_images_attributes: [:image]).merge(seller_id: current_user.id)
  end

end


