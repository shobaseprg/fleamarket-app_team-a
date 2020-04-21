FactoryBot.define do

  factory :item_image do
    sequence(:id){|n| "#{n}"}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images.jpeg')) }
    created_at{"2020-04-17 07:51:02"}
    updated_at{"2020-04-17 07:51:02"}
    item_id{"1"}

  end

end