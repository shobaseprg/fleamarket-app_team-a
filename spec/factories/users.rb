FactoryBot.define do

  factory :user do
    first_name{"山田"}
    family_name{"太郎"}
    first_name_reading{"ヤマダ"}
    family_name_reading{"タロウ"}
    email                 {"1@gmail.com"}
    phone_number{"08099999999"}
    birthday{"2018-06-06"}
    password              {"0000000a"}
    password_confirmation {"0000000a"}
  end

end

lib/locales/ja.yml 