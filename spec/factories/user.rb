FactoryBot.define do

  factory :user do

    sequence(:id){|n| "#{n}"}
    # 複数作成時にバリデーションエラーを避けるため連番作成
    first_name{"山田"}
    family_name{"太郎"}
    first_name_reading{"ヤマダ"}
    family_name_reading{"タロウ"}
    email                 { Faker::Internet.email }
    # 複数作成時にバリデーションエラーを避けるためランダム作成
    phone_number{Faker::Number.unique.number(digits: 10)}
    # 複数作成時にバリデーションエラーを避けるためランダム作成

    birthday{"2018-06-06"}
    password              {"0000000a"}
    password_confirmation {"0000000a"}

    self_introduction{"よろしくお願いいたします"}
  end

end