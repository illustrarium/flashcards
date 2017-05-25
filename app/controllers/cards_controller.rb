class CardsController < ApplicationController
  def index
    @cards = current_user.cards
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.build(card_params)
    # @card = Card.new(card_params)
    if @card.save
      redirect_to @card, notice: 'Карточка успешно создана'
    else
      render :new
    end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])

    if @card.update(card_params)
      redirect_to @card, notice: "Карточка успешно обновлена"
    else
      redirect_to @card, notice: "Карточка не обновлена"
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end
end
