# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyText"
    due_on "2012-05-28"
    completed_at ""
    order 1
    user_id 1
  end
end
