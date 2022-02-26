FactoryBot.define do
  factory :user do
    name { "Harasou" }
    email { "harasou@example.com" }

    trait :but_empty_name do
      name {""}
    end

    trait :but_empty_email do
      email {""}
    end

    trait :but_have_long_name do
      name {"a"*51}
    end

    trait :but_have_long_email do
      email {"a"*244+"@example.com"}
    end
  end
end
