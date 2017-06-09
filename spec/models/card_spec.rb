require 'rails_helper'

RSpec.describe Card, :type => :model do
  let(:card) { FactoryGirl.create(:card) }

  it "Check translate" do
    expect(card.check_translate("crt")).to be 1
  end

  # it "Set review date and count" do
  #   card.check_count = 2
  #   time_to_be = Time.now + 259200
  #   card.set_review_date(card.check_count)
  #   expect(card.check_count).to eq 3
  #   expect(card.review_date.strftime('%Y-%m-%d')).to eq(time_to_be.strftime('%Y-%m-%d'))
  # end

  it "Set img to nil" do
    expect(card.remove_cardimg).to be_nil
  end

  it 'get correct review date on create' do
    expect(card.review_date.to_date).to eq(Time.now.to_date)
  end

  # it "Check errors" do
  #   card.check_errors
  #   expect(card.erros_count).to eq 1
  # end
end
