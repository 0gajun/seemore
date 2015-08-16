FactoryGirl.define do
  factory :menu do
    restaurant_id   1
    name            "キーマカレー"
    price           780
    category_id     1

    factory :menu2 do
      restaurant_id 2
      name          "つけそば"
      price         700
      category_id   2
    end
  end
end
