class CardsController < ApplicationController
  before_action :set_card, only: %i[ show edit update destroy ]
  before_action :set_deck, only: %i[ index edit update]

  # GET /cards or /cards.json
  def index
    @cards = @deck.cards
  end

  # GET /cards/1 or /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to card_url(@card), notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to deck_path(@deck), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @deck}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy!

    respond_to do |format|
      format.html { redirect_to deck_path, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end
    # find the current deck
    def set_deck
      @deck = Deck.find(params[:deck_id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:question, :answer)
    end
end
