class ItemsController < ApplicationController
  before_action :set_current_user_items,only:[:i_OnSale,:i_trading,:i_SoldOut]
  before_action :set_user,only:[:i_OnSale,:i_trading,:i_SoldOut]
 # before_action :set_item, except: [:index, :new, :create]

  def i_OnSale #出品中のアクション

  end

  def i_trading  #取引中のアクション

  end

  def i_SoldOut    #売却済みのアクション

  end


  def index
    # @items = Item.all
    # parent_id = params[:parent_id]

    # items = Item.all.order("id DESC")
    # items1 = []
    # items2 = [].take(10)
    # items3 = [].take(10)
    # items4 = [].take(10)
    # items.each do |item|
    #   if item.category.parent.parent.id == 1
    #     items1.push(item)
    #   elsif item.category.parent.parent.id == 2
    #     items2.push(item)
    #   elsif item.category.parent.parent.id == 8
    #     items3.push(item)
    #   elsif item.category.parent.parent.id == 6
    #     items4.push(item)
    #   end
    # end
    # @items1 = items1.first(10)
    # @items2 = items2.first(10)
    # @items3 = items3.first(10)
    # @items4 = items4.first(10)
    @items1 = Category.find(1).items.last(10)
    @items2 = Category.find(2).items.last(10)
    @items3 = Category.find(8).items.last(10)
    @items4 = Category.find(6).items.last(10)
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
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
      redirect_to root_path
    else
      render :edit
    end
  end
 
  def destroy
    @product.destroy
    redirect_to root_path
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
          item = category.items.order("id DESC")
          @items.push(item)
        end
      @items.flatten!
      # 配列の平坦化
   end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.seller_id)
    @images = @item.item_images
    @imagesLENGTH = @images.length 
    @category = @item.category
  end

  private
  def item_params
    params.require(:item).permit(:name, :description_item, :brand_id, :category_id, :condition_id, :shipping_charger_id, :shipping_method_id, :ship_from_id, :shipping_days_id, :price, item_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

