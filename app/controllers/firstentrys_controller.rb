class FirstentrysController < ApplicationController

  before_action :set_params

  def show
    selection_id = @firstentry.player.selection_id = @selection.id
    @firstentry.player.save({"selection_id": selection_id})
    redirect_to(tournament_path(@tournament))
  end

    private

  def set_params
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.find(params[:round_id])
    @match = Match.find(params[:match_id])
    @firstentry = Firstentry.find(params[:id])
    # @secondtentry = Secondtentry.find(params[:secondtentry_id])
    # @player = Player.find(params[:id])
    @selection = Selection.find_or_create_by("id": @tournament.id)
  end
end
