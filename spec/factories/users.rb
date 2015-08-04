FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password 'Pa$sw0rd'
    password_confirmation 'Pa$sw0rd'
    #is_admin false
    #confirmed_at Date.today
  end

  factory :admin, parent: :user do
    #is_admin true
  end

end
