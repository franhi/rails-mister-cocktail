class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
      @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
    @dose = @cocktail
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save!
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

  end

def cocktails_params
  params.require(:cocktail).permit(:name, :photo)
end


end
