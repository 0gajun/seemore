FactoryGirl.define do
  factory :coupon do
    title           "味玉サービス!!!"
    restaurant_id   1
    content         "クーポンご提示のお客様に味玉プレゼント"
    condition       "他券との併用不可"
    expiration_date Date.new(2015, 12, 12)
    remain          100
  end

end
