
class CardsController < ApplicationController
  require 'payjp'

  def index #CardのデータをPayjpに送って情報を取り出す
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    if @card.present?
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def create
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
      @card = Card.new(user_id: user_id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to "/"
      else
        redirect_to action: "new"
      end
    end
  end

  def destroy #PayjpとCardのデータベースを削除
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      flash[:notice2] = '削除しました'
      redirect_to action: "index"
    else #削除に失敗した時にアラートを表示します。
      flash[:alert2] = '削除できませんでした'
      redirect_to action: "index"
    end
  end

  def show 
    @item = Item.find(params[:id])
      card = Card.where(user_id: current_user.id).first
      #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
      if card.blank?
        #登録された情報がない場合にカード登録画面に移動
        redirect_to cards_path
      else
        Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
        #保管した顧客IDでpayjpから情報取得
        customer = Payjp::Customer.retrieve(card.customer_id)
        #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
        @card_information = customer.cards.retrieve(card.card_id)
      end
  end

  def pay
    @item = Item.find(params[:id])
    @item.update(buyer_id: current_user.id)
    # 現在のユーザーを購入者に登録
    card = Card.where(user_id: current_user.id).first
    Rails.application.credentials[:payjp][:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    :amount => @item.price, 
    :customer => card.customer_id, 
    :currency => 'jpy', #日本円
  )
  redirect_to item_purchase_index_path(@item.id)
  # 購入確認画面に遷移
  end


end