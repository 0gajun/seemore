FactoryGirl.define do
  factory :user do
    # デフォルトテストユーザ
    username    "seemore"
    email       "seemore@seemore.inc"
    nickname    "seemore"
    birth_date  Date.new(2015, 8, 5)
    sex         1
    grade       "学部4年"
    comment     "I'm Seemore. Seemore everything. I'm Seemore. Seemore everythig, no more ashmed."
    # デフォルトテストユーザ2
    factory :user2 do
      username    "John"
      email       "John@seemore.inc"
      nickname    "John"
      birth_date  Date.new(1990, 8, 5)
      sex         0
      grade       "学部4年"
      comment     "John!"
    end
  end
end
