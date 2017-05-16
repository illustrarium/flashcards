class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to @card, notice: 'Карточка успешно создана'
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @card.update(params)
      redirect_to @card, notice: "Карточка обновлена"
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
  end

  private

    def card_params
      params.require(:card).permit(:original_text, :translated_text)
    end
end








