FactoryBot.define do
  factory :user do
    name { "Harasou" }
    email { "harasou@example.com" }
    password { "foobar" }
    password_confirmation { "foobar" }

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

    trait :but_have_empty_password do
      password { ""*6 }
      password_confirmation { password }
    end

    trait :but_have_less_5_characters_password do
      password { "a"*5 }
      password_confirmation { password }
    end

    trait :every_invalid do
      name { "" }
      email { "user@invalid" }
      password { "foo" }
      password_confirmation { "bar" }
    end
  end
end
