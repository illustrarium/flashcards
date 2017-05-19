require 'rails_helper'

RSpec.describe Card, :type => :model do
  before(:each) do
    @card = FactoryGirl.create(:card)
  end

  it "Check translate" do
    expect(@card.check_translate("battlestart")).to be false
  end

  it "Set review date 3 days from now" do
    expect(@card.set_review_date.strftime('%d/%m/%Y')).to eq(3.days.from_now.strftime('%d/%m/%Y'))
  end
end
