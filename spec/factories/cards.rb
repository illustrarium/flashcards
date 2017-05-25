FactoryGirl.define do
  factory :card do
    original_text "cat"
    translated_text "кот"
    user
    cardimg { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg'), 'image/jpg') }
  end
end
