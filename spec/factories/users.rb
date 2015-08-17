FactoryGirl.define do
  salt = "asdasdastr4325234324sdfds"
  factory :user do
    # デフォルトテストユーザ
    username    "seemore"
    email       "seemore@seemore.inc"
    salt        salt 
    password    Sorcery::CryptoProviders::BCrypt.encrypt("hogehoge", salt)
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
    factory :user3 do
      username    "shishamo"
      email       "shishamo@seemore.inc"
      nickname    "shishamo"
      birth_date  Date.new(1990, 8, 5)
      sex         0
      grade       "学部4年"
      comment     "量産型彼氏"

    end
    factory :user4 do
      username    "androp"
      email       "androp@seemore.inc"
      nickname    "androp"
      birth_date  Date.new(1990, 8, 5)
      sex         1
      grade       "学部4年"
      comment     "Voice!"

    end
  end
end
