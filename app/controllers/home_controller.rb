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
      SuperMemo2.new(@card).successful(params[:time].to_i)
      @card.save
      redirect_to home_index_path, notice: t(".correct")
    elsif @card.check_translate(params[:user_variant]) == 1
      SuperMemo2.new(@card).successful(params[:time].to_i)
      @card.save
      redirect_to home_index_path, alert: t(".nope", user_variant: params[:user_variant], original_text: @card.original_text, translated_text: @card.translated_text)
    else
      SuperMemo2.new(@card).failed
      @card.save
      redirect_to home_index_path, alert: t(".incorrect")
    end
  end
end
