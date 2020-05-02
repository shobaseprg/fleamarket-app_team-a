class AddressesController < ApplicationController

  def index
    @address = current_user.address
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
   if @address.save
      flash[:notice] = '登録しました'
      redirect_to root_path
    else
      flash[:alert] = '登録できませんでした'
      redirect_to new_address_path
    end
  end

  def edit
    if user_signed_in? && current_user.address.id == params[:id].to_i
      @address = Address.find(params[:id])
    else
      flash[:alert] = "他のユーザーの住所は変更できません"
      redirect_to root_path
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = '編集完了しました'
      redirect_to root_path
    else
      flash[:alert] = '編集できませんでした'
      redirect_to edit_address_path(current_user.address.id)
    end
  end
   
  def destroy
    if user_signed_in? && current_user.address.id == params[:id].to_i
      @address = Address.find(params[:id])
      if @address.destroy
        flash[:notice] = '削除しました'
        redirect_to root_path
      else
        flash[:alert] = '編集できませんでした'
        redirect_to root_path
      end
    else
      flash[:alert] = "他のユーザーの住所は変更できません"
      redirect_to root_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:address_first_name, :address_family_name, :postal_code, :prefectures, :municipality,:block_number,:building, ).merge(user_id: current_user.id)
  end
end