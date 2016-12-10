class PicksController < ApplicationController


  def show
    @pick = Pick.find(params[:id])
    @pick.validated = true
    @pick.save
    redirect_to tournament_path(@pick.selection_id)
  end


end
