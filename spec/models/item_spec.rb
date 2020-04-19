require 'rails_helper'

describe Item do
  describe '#create' do
    it "正常な入力でパスすること" do
      item = build(:item)
      item.valid?
      expect(item.valid?).to be_truthy
    end


    it "名前が空欄ははじく" do
      item = build(:item, name: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "説明が空欄ははじく" do
      item = build(:item, description_item: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "親カテゴリーが空欄ははじく" do
      item = build(:item,parent_category_id: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "子カテゴリーが空欄ははじく" do
      item = build(:item,children_category_id: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "孫カテゴリーが空欄ははじく" do
      item = build(:item,category_id: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "ブランドが空欄ははじく" do
      item = build(:item,brand_id: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "こんでぃしょんが空欄ははじく" do
      item = build(:item,condition_id: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "shipping_charger_idが空欄ははじく" do
      item = build(:item,shipping_charger_id: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "shipping_days_idが空欄ははじく" do
      item = build(:item,shipping_days_id: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end


    it "ship_from_idが空欄ははじく" do
      item = build(:item,ship_from_id: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "priceが空欄ははじく" do
      item = build(:item,price: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "sales_feeが空欄ははじく" do
      item = build(:item,sales_fee: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "sales_feeが空欄ははじく" do
      item = build(:item,sales_fee: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "sales_profitが空欄ははじく" do
      item = build(:item,sales_profit: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "seller_idが空欄ははじく" do
      item = build(:item,seller_id: "")
      item.valid?
      expect(item.valid?).to be_falsey
    end

    it "写真が空欄ははじく" do
      item_image = build(:item_image ,id: "")
      item_image.valid?
      expect(item_image.valid?).to be_falsey
    end

  end
end
