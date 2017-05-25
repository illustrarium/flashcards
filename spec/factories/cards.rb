FactoryGirl.define do
  factory :card do
    original_text "cat"
    translated_text "кот"
    user
    cardimg { File.new("#{Rails.root}/spec/photos/test.jpg") }
  end
end
