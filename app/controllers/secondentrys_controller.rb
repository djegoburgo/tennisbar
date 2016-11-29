class SecondentrysController < ApplicationController
  before_action :set_params

  def show
    # @selection = Selection.new
    # @selection.secondentry_id = @secondentry.id
    # @selection.save
    # redirect_to(tournament_path(@tournament))
    selection_id = @secondentry.player.selection_id = @selection.id
    @secondentry.player.save({"selection_id": selection_id})
    redirect_to(tournament_path(@tournament))
  end

    private

  def set_params
    @tournament = Tournament.find(params[:tournament_id])
    @round = Round.find(params[:round_id])
    @match = Match.find(params[:match_id])
    # @firstentry = Firstentry.find(params[:id])
    @secondentry = Secondentry.find(params[:id])
    # @player = Player.find(params[:id])
    @selection = Selection.find_or_create_by("id": @tournament.id)
  end
end
