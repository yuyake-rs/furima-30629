FactoryBot.define do
  factory :item do
    name                  {"缶コーヒー"}
    information           {"飲み物です"}
    category_id           {"1"}
    condition_id          {"1"}
    delivery_fee_id       {"1"}
    ship_from_location_id {"1"}
    delivery_start_id     {"1"}
    price                 {"300"}
    association :user
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/image/images.jpeg')) }
    end 
  end