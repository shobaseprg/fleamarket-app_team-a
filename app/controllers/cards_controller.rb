class CardsController < ApplicationController

  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)# current_user.idをuser_idに格納して、cardの新規レコードを作成する　うえやま
    # redirect_to action: "show" if card.exists?
  end

  def create #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = 'sk_test_0c40fd2bbc8f1aac67d8caba'# 秘密鍵をPayjp.api_keyに格納　うえやま
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token']
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(1)
      else
        redirect_to action: "new"
      end
    end
  end

  # def delete #P'ayjpとCardデータベースを削除します
  #   card = Card.where(user_id: current_user.id).first
  #   if card.blank?
  #   else
  #     Payjp.api_key = 'sk_test_0c40fd2bbc8f1aac67d8caba'
  #     customer = Payjp::Customer.retrieve(card.customer_id)
  #     customer.delete
  #     card.delete
  #   end
  #     redirect_to action: "new"
  # end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = 'sk_test_0c40fd2bbc8f1aac67d8caba'
      # customer = Payjp::Customer.retrieve(card.customer_id)
      # @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end