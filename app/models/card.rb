class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :check_texts

  before_validation :set_review_date, on: :create

  private

  def set_review_date
    self.review_date = 3.days.from_now
  end

  def check_texts
    errors.add(:original_text, "Значения полей должны отличаться") if original_text.downcase == translated_text.downcase
  end
end
