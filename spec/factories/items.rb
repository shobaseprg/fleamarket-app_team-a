FactoryBot.define do

  factory :item do
    name {"テレビ"}
    description_item {"テレビです"}

    category_id {"81"}
    parent_category_id {"1"}
    children_category_id {"14"}

    brand_id{"1"}
    condition_id{"1"}

    shipping_charger_id{"1"}
    shipping_method_id{"1"}
    ship_from_id{"1"}
    shipping_days_id{"1"}

    price{"3000"}
    sales_fee{"300"}
    sales_profit{"2700"}
    seller_id{"1"}
    buyer_id{""}
    auction_id{""}
    created_at{"2020-04-17 07:51:02"}
    updated_at{"2020-04-17 07:51:02"}
  end

end