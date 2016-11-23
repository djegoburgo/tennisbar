class FirstentrysController < ApplicationController

  before_action :set_params

  def show
    @selection = Selection.new
    @selection.firstentry_id = @firstentry.id
    @selection.save
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
  end
end
