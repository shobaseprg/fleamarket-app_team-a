require 'rails_helper'

feature 'item', type: :feature do
  let(:category1) { create(:category) }
  let(:category14) { create(:category,id: 14,name: "トップス",ancestry:"1") }
  let(:category81) { create(:category,id: 81,name: "Tシャツ",ancestry:"1/14") }
  let(:user){create(:user)}
  let(:other_user){create(:user,id: user.id.to_i + 1)}
  let(:item){create(:item,seller_id:other_user.id, parent_category_id:category1.id,children_category_id:category14.id,category_id:category81.id)}
  # 異なるユーザーの出品
  let(:item_image) {create_list(:item_image, 3,item_id: item.id)}

  scenario 'カードがなければ購入できないこと' do
    # ログイン前には投稿ボタンがない
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: user.password
    click_on 'ログイン'
    
    item_image
    expect(current_path).to eq root_path
    # ログインしたらルートに遷移する。
    click_on 'もっと見る ＞', match: :first
    expect(current_path).to eq list_from_category_item_path(1)
    page.first("#test").click
    click_on '購入する'
    expect(current_path).to eq cards_path
  end
end