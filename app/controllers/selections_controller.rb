class SelectionsController < ApplicationController


  def destroy
    @selection = Selection.find(params[:id])
    @selection.destroy
    redirect_to tournament_path
  end

  private

end
