
class CardsController < ApplicationController
  require 'payjp'

  def create
    Payjp.api_key = 'sk_test_0c40fd2bbc8f1aac67d8caba'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      user_id = current_user.id
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      ) 
      @card = Card.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to "/"
      else
        redirect_to action: "new"
      end
    end
  end
end