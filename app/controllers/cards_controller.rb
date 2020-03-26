
class CardsController < ApplicationController
  require 'payjp'

  def create
    binding.pry
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
    # credential.yamlからPayjp.api_keyを設定（秘密鍵）
    if params['payjp-token'].blank?
      redirect_to action: "new"
      # トークンが取得出来てなければループ
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      # params['payjp-token']（response.id）からcustomerを作成
      ) 
      @card = Card.new(card_params)
      if @card.save
        redirect_to "/"
      else
        redirect_to action: "new"
      end
    end
  end


  private
  def card_params
    params.require(:card).permit(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
  end
end

