require 'rails_helper'

describe User do
  describe '#create' do

    it "正常な入力でパスすること" do
      user = build(:user)
      expect(user.valid?).to be_truthy
    end

    it "名前が空欄でエラー" do
      user = build(:user, first_name: "")
      binding.pry
      expect(user.valid?).to be_falsey
    end
  end
end
