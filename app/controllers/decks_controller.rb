class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]

  def index
    @decks = current_user.decks
  end

  def show; end

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.build(deck_params)
    if @deck.save
      redirect_to @deck, notice: t(".deck_success_added")
    else
      render :new
    end
  end

  def edit; end

  def update
    if @deck.update(deck_params)
      redirect_to @deck, notice: t(".deck_was_updated")
    else
      redirect_to @deck, notice: t(".deck_update_failed")
    end
  end

  def destroy
    @deck.destroy
    redirect_to decks_path
  end

  def set_current
    current_user.update(current_deck_id: params[:deck][:id])
    redirect_to decks_path, notice: t(".current_deck_was_updated")
  end

  private

  def set_deck
    @deck = Deck.find(params[:id])
  end

  def deck_params
    params.require(:deck).permit(:title, :current)
  end
end
