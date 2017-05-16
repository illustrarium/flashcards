class Card < ApplicationRecord
  validates :original_text, :translated_text, presence: true
  #validates :original_text, :translated_text, presence: true

  before_create :set_review_date

  private
    def set_review_date
      @params = Time.now + (60*60*24*3)
    end
end
