class HomeController < ApplicationController
  def index
    if current_user.current_deck_id
      @card = current_user.cards.time_to_review.where(deck_id: current_user.current_deck_id).random.limit(1)
    else
      @card = current_user.cards.time_to_review.random.limit(1)
    end
  end

  def check
    @card = Card.find(params[:card][:id])

    if @card.check_translate(params[:user_variant]).zero?
      @card.set_review_date(@card.check_count)
      @card.save
      redirect_to home_index_path, notice: t(".correct")
    elsif @card.check_translate(params[:user_variant]) == 1
      @card.check_errors
      @card.save
      redirect_to home_index_path, alert: t(".nope", user_variant: params[:user_variant], original_text: @card.original_text, translated_text: @card.translated_text)
    else
      @card.check_errors
      @card.save
      redirect_to home_index_path, alert: t(".incorretc")
    end
  end
end
