require 'rails_helper'

describe User do
  describe '#create' do

    it "すべて入力済で登録できること" do
      user = build(:user)
      expect(user.valid?).to be_truthy
    end
# ーーーーーーーーーーーーーーーーーーーーーーー
    it "名前が空なら登録できないこと" do
      user = build(:user, first_name: "")
      expect(user.valid?).to be_falsey
    end

    it "名前が半角なら登録できないこと" do
      user = build(:user, first_name: "a")
      expect(user.valid?).to be_falsey
    end
# ーーーーーーーーーーーーーーーーーーーーーーーー

    it "苗字が空なら登録できないこと" do
      user = build(:user, family_name: "")
      expect(user.valid?).to be_falsey
    end

    it "苗字が半角なら登録できないこと" do
      user = build(:user, family_name: "a")
      expect(user.valid?).to be_falsey
    end

    # ーーーーーーーーーーーーーーーーーーーーーー
    it "名前(ヨミ）が空欄なら登録できないこと" do
      user = build(:user, first_name_reading: "")
      expect(user.valid?).to be_falsey
    end

    it "名前(ヨミ）が ひらがななら登録できないこと" do
      user = build(:user, first_name_reading: "あ")
      expect(user.valid?).to be_falsey
    end

    it "名前(ヨミ）が半角なら登録できないこと" do
      user = build(:user, first_name_reading: "a")
      expect(user.valid?).to be_falsey
    end

    # ーーーーーーーーーーーーーーーーーーーーーーーーーー
    it "苗字(ヨミ）が空欄なら登録できないこと" do
      user = build(:user, first_name_reading: "")
      expect(user.valid?).to be_falsey
    end

    it "苗字(ヨミ）がひらがななら登録できないこと" do
      user = build(:user, first_name_reading: "あ")
      expect(user.valid?).to be_falsey
    end

    it "苗字(ヨミ）が半角なら登録できないこと" do
      user = build(:user, first_name_reading: "a")
      expect(user.valid?).to be_falsey
    end

    it "名前(ヨミ）が空欄なら登録できないこと" do
      user = build(:user, first_name_reading: "")
      expect(user.valid?).to be_falsey
    end
# --------------------------------------------------------
    it "自己紹介が１０００文字以上なら登録できないこと" do
      user = build(:user, self_introduction: Faker::Base.regexify("[あ]{1001}"))
      expect(user.valid?).to be_falsey
    end

    it "自己紹介が1000文字なら登録できること" do
      user = build(:user, self_introduction: Faker::Base.regexify("[あ]{1000}"))
      expect(user.valid?).to be_truthy
    end
# -------------------------------------------------------
    it "パスワードが６文字なら登録できないこと" do
      user = build(:user, password: "12345a")
      expect(user.valid?).to be_falsey
    end


    it "パスワードが全て英語なら文字なら登録できないこと" do
      user = build(:user, password: "aaaaaaa")
      expect(user.valid?).to be_falsey
    end

    it "パスワードが全て数字なら文字なら登録できないこと" do
      user = build(:user, password: "111111111")
      expect(user.valid?).to be_falsey
    end

    it "パスワードが全て数字なら文字なら登録できないこと" do
      user = build(:user, password: "111111111")
      expect(user.valid?).to be_falsey
    end
# ----------------------------------------------------------
    it "重複したemailでは登録できないこと" do
      user1 = create(:user,id:1,phone_number:"08011111111",email: "9@gmail.com")
      user2 = build(:user,id:2,phone_number:"08022222222",email: "9@gmail.com")
      expect(user2.valid?).to be_falsey
    end

    it "重複した電話番号では登録できないこと" do
      user1 = create(:user,id:1,phone_number:"08011111111",email: "1@gmail.com")
      user2 = build(:user,id:2,phone_number:"08011111111",email: "9@gmail.com")
      expect(user2.valid?).to be_falsey
    end
    
  end
end
      