class HomeController < ApplicationController
  def index
    @card = if current_user.current_deck_id
              current_user.cards.time_to_review.where(deck_id: current_user.current_deck_id).random.limit(1)
            else
              current_user.cards.time_to_review.random.limit(1)
            end
  end

  def check
    @card = Card.find(params[:card][:id])

    respond_to do |format|
      if @card.check_translate(params[:user_variant]).zero?
        SuperMemo2.new(@card).successful(params[:time])
        format.js { flash.now[:notice] = t(".correct") }
      elsif @card.check_translate(params[:user_variant]) == 1
        SuperMemo2.new(@card).successful(params[:time])
        format.js { flash.now[:notice] = t(".nope", user_variant: params[:user_variant], original_text: @card.original_text, translated_text: @card.translated_text) }
      else
        SuperMemo2.new(@card).failed
        format.js { flash.now[:alert] = t(".incorrect") }
      end
    end
  end
end
