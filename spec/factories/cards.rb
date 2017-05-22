FactoryGirl.define do
  factory :card do
    original_text "cat"
    translated_text "кот"
    user
  end
end
