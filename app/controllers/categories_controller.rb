class CategoriesController < ApplicationController
  def index
  end

  def show
    # @category = Category.find(params[:id])
    # @items = Item.where(category_id: params[:id]) if @category.children.length == 0
    # ids = @category.children.pluck(:id)
    # @items = Item.where(category_id: ids)

    category = Category.find(params[:id])
    if category.children.length == 0
      @category = Category.find(params[:id])
      @items = Item.where(category_id: params[:id]).order("id DESC")
      return
    end

    categories = category.children
    ids = []
    categories.each do |item|
      id = item.children.pluck(:id)
      id.each do |i|
        ids.push(i)
      end
    end
    if ids.length == 0
      ids = category.children.pluck(:id)
      @items = Item.where(category_id: ids).order("id DESC")
      @category = Category.find(params[:id])
    end
    @items = Item.where(category_id: ids).order("id DESC")
    @category = Category.find(params[:id])
  end

  def get_child_category
    respond_to do |format|
      format.html
      format.json do
        @childs = Category.find(params[:parent_id]).children
      end
    end
  end

end
