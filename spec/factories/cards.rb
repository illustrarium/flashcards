FactoryGirl.define do
  factory :card do
    original_text "cat"
    translated_text "кот"
    user
    deck
    cardimg { File.new("#{Rails.root}/spec/photos/test.jpg") }
  end
end
