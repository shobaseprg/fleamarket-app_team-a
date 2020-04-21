FactoryBot.define do

  factory :user do

    id{"1"}
    first_name{"山田"}
    family_name{"太郎"}
    first_name_reading{"ヤマダ"}
    family_name_reading{"タロウ"}
    email                 { Faker::Internet.email }
    phone_number{"08099999999"}
    birthday{"2018-06-06"}
    password              {"0000000a"}
    password_confirmation {"0000000a"}

    self_introduction{"よろしくお願いいたします"}
  end

end