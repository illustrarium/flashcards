require 'rails_helper'

RSpec.describe Card, :type => :model do
  let(:card) { FactoryGirl.create(:card) }

  it "Check translate" do
    expect(card.check_translate("battlestart")).to be false
  end

  it "Set review date 3 days from now" do
    expect(card.set_review_date.strftime('%d/%m/%Y')).to eq(3.days.from_now.strftime('%d/%m/%Y'))
  end

  it "Set img to nil" do
    expect(card.remove_cardimg).to be_nil
  end
end
