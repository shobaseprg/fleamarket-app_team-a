require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'GET #show' do
    # itemコントーラーのshowアクションのテスト

      let(:category1) { create(:category) }
      let(:category14) { create(:category,id: 14,name: "トップス",ancestry:"1") }
      let(:category81) { create(:category,id: 81,name: "Tシャツ",ancestry:"1/14") }
      let(:user){create(:user)}
      let(:item){create(:item,seller_id:user.id,parent_category_id:category1.id,children_category_id:category14.id,category_id:category81.id)}
      let(:item_image) {create_list(:item_image, 3,item: item)}

    it "@item に正しい値が入ること" do

      get :show, params:{ id: item.id}

      expect(assigns(:item)).to eq item
      expect(assigns(:user)).to eq user
      expect(assigns(:mago)).to eq category81
      expect(assigns(:ko)).to eq category14
      expect(assigns(:oya)).to eq category1
    end

    it "show.html.hamlに遷移すること" do
      
      get :show, params:{ id: item.id}

      expect(response).to render_template :show
    end

  end
end 