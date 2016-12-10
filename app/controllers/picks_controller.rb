class PicksController < ApplicationController


  def show
    @pick = Pick.find(params[:id])
    @pick.validated = true
    @pick.update(@pick.attributes)
    redirect_to tournament_path(@pick.selection_id)
  end

  # def pick_params
  #   params.require(:pick)
  # end

end
