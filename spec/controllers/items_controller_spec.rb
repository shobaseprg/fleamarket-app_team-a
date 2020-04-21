require 'rails_helper'

describe ItemsController, type: :controller do

  # ===================================
  # showのテスト
  # ===================================
  describe 'GET #show' do
    let(:category1) { create(:category) }
    let(:category14) { create(:category,id: 14,name: "トップス",ancestry:"1") }
    let(:category81) { create(:category,id: 81,name: "Tシャツ",ancestry:"1/14") }
    let(:user){create(:user)}
    let(:item){create(:item,seller_id:user.id,parent_category_id:category1.id,children_category_id:category14.id,category_id:category81.id)}
    let(:item_image) {create_list(:item_image, 3,item_id: item.id)}
      # 変数を定義
      
    it "@item に正しい値が入ること" do
      get :show, params:{ id: item.id}
      # 擬似的にshowアクションを起動（params[:id]には上記で作成した、itemのidを使用）
      expect(assigns(:item)).to eq item
      expect(assigns(:user)).to eq user
      expect(assigns(:mago)).to eq category81
      expect(assigns(:ko)).to eq category14
      expect(assigns(:oya)).to eq category1
      # 上記で作った変数の中身と、アクションを経由して作成されたデータが同一であるかをチェック
    end

    it "show.html.hamlに遷移すること" do
      get :show, params:{ id: item.id}
      expect(response).to render_template :show
    end
  end

  # ===================================
  # indeのテスト
  # ===================================
  describe 'GET #index' do
    let(:category1) { create(:category) }
    let(:category_mens) { create(:category,name: "メンズ", id: 2)}
    let(:category14) { create(:category, id: 14,name: "トップス",ancestry:"1") }
    let(:category81) { create(:category, id: 81,name: "Tシャツ",ancestry:"1/14") }
    let(:user){create(:user)}
    let(:items_of_lady){create_list(:item,10,name: "レディース商品",seller_id: user.id,parent_category_id: category1.id, children_category_id: category14.id,category_id: category81.id)}
    let(:items_of_mens){create_list(:item,10,name: "メンズ商品",seller_id: user.id,parent_category_id: category_mens.id, children_category_id: category14.id,category_id: category81.id)}

    it "レディースのみをitems1に格納できているか。idの降順となっているか" do
      items_of_lady
      items_of_mens
      # letは遅延評価のため呼び出す必要あり
      get :index
        expect(assigns(:items1)).to match(items_of_lady.sort{ |a, b| b.id <=> a.id } )
    end
    
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

# ===================================
# newのテスト
# ===================================
  describe 'GET #new' do
    let(:user){create(:user)}
   
    context'ログインしている場合' do
      before do
        login user
      end
        it 'new.html.hamlに遷移すること' do
          get :new
          expect(response).to render_template :new
        end
    end

    context 'ログインしていない場合' do
      it "ログインに遷移するかどうか" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

# ===================================
# createのテスト
# ===================================
  describe 'GET #create' do
    let(:user){create(:user)}

    before do
      login user
    end

      let(:category1) { create(:category) }
      let(:category14) { create(:category,id: 14,name: "トップス",ancestry:"1") }
      let(:category81) { create(:category,id: 81,name: "Tシャツ",ancestry:"1/14") }
      let(:item){create(:item,seller_id:user.id,parent_category_id:category1.id,children_category_id:category14.id,category_id:category81.id)}
      let(:item_image) {create_list(:item_image, 3,item_id: item.id)}

      context '保存に成功した場合'do
        it'Itemのレコードが一つ増えるか' do 
          item_image       
          expect{post :create ,params:{seller_id: user.id,item: attributes_for(:item)}}.to change(Item, :count).by(1)
          # 正しいパラメーターを受けて取ってcreateアクションが発動した場合、item数が１増える。
        end

        it 'ルートパスに遷移するか' do
          item_image
          post :create,params:{seller_id: user.id,item: attributes_for(:item)}
          expect(response).to redirect_to(root_path)
      end

      context '保存に失敗した場合'do
        it 'Itemの数は増えない'do
          expect{post :create,params:{seller_id:user.id, item: attributes_for(:item,name: nil)}}.not_to change(Item, :count)
          # バリデーションに失敗するデーターを持って発動した場合,Itemレコードの数は増えない。
        end 

        it 'new.html.hamlに遷移すること' do
          post :create,params:{seller_id:user.id, item: attributes_for(:item,name: nil)}
          expect(response).to redirect_to(new_item_path)
        end
      end


  end
  
end
end