require 'rails_helper'

describe ItemsController do
  
  describe "get #index" do
    it "index画面に遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

    describe "get #new" do
      it "new画面に遷移すること" do
        get :new
        expect(response).to render_template :new
      end
    end
    
end