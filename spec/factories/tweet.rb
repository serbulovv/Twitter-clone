FactoryBot.define do
  factory :tweet do
    text { Faker::Books::Lovecraft.paragraph_by_chars(characters: 200) }
  end
end
