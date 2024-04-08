FactoryBot.define do
  factory :item do
   
   #image                        {Faker::Lorem.sentence}
   image { Rack::Test::UploadedFile.new(Rails.root.join('public', 'images/images', 'sample.jpg'), 'image/jpeg') }
    name                        { 'パソコン' }
    detail                      { '3年前に購入したMacBookです' }
    category_id                 { 2 }
    sales_status_id             { 2 }
    shipping_fee_status_id      { 2 }
    prefecture_id               { 2 }
    scheduled_delivery_id       { 2 }
    price                    { 50000 }

    association :user

  end
end

