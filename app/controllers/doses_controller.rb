require 'byebug'
class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to @dose.cocktail
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
