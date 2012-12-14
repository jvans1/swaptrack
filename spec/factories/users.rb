# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name {Faker::Name.first_name}
    email {Faker::Name.last_name}
    password "password"
  end
end


FactoryGirl.define do
  factory :user_with_recuest, :parent => :user do |user|
    user.after_create{ |u| Factory(:recuest, :user => u )}
  end
end

# Factory.define :article_with_comment, :parent => :article do |article|
#   article.after_create { |a| Factory(:comment, :article => a) }
# end