require 'rails_helper'

  describe ItemsController do
    describe 'get #show' do
      it "@itemが期待した値となるか" do
        item = build(:item)
        get :show,params:{id: item}
binding.pry
        expect(assigns(:item)).to eq item
      end
    end    
  end