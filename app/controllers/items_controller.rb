class ItemsController < ApplicationController
  before_action :set_current_user_items,only:[:i_OnSale,:i_trading,:i_SoldOut]
  before_action :set_user,only:[:i_OnSale,:i_trading,:i_SoldOut]
  before_action :set_item, only: [:show,:edit,:update]

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
      redirect_to root_path
    else
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

  def edit
  end
 
  def update
    if @item.update(item_params)
       @item.update(sales_fee: @item.price/10, sales_profit: @item.price - (@item.price/10))
      redirect_to root_path
    else
      render :edit
    end
  end
 
  def destroy
    @item.destroy
    redirect_to root_path
  end

  def list_from_category
    @categorysNAME = []
    @items = []
    self_ancestory_categoryIDs = Category.find(params[:id]).path_ids # 選択されたカテゴリーの自分と先祖のidを全て取得
      self_ancestory_categoryIDs.each do |categoryID|
        @categorysNAME << Category.find(categoryID).name
        # 選択されたカテゴリーと親のnameを格納
      end
    self_progeny = Category.find(params[:id]).subtree
    # 自己と子供のカテゴリーを格納
      self_progeny.each do |category|
        item = category.items
        @items.push(item)
      end
    @items.flatten!
    # 配列の平坦化
  end

  def show
    @user = User.find(@item.seller_id)
    @images = @item.item_images
    @imagesLENGTH = @images.length 
    @category = @item.category
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
    params.require(:item).permit(:name, :description_item, :brand_id, :category_id, :condition_id, :shipping_charger_id, :shipping_method_id, :ship_from_id, :shipping_days_id, :price, item_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  
end