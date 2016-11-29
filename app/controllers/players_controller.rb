class PlayersController < ApplicationController

  def destroy
    @selection = Selection.find(params[:selection_id])
    @player = Player.find(params[:id])
    @player.selection_id = nil
    @player.save
    redirect_to tournaments_path
  end

end
