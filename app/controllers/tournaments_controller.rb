class TournamentsController < ApplicationController

  require_relative './scrapper.rb'

  before_action :set_tournament, only: [:show, :search_rounds]
  before_action :set_selections
  before_action :set_pick

  def index
    require 'open-uri'
    require 'nokogiri'

    Tournament.destroy_all

    doc = Nokogiri::HTML(open("http://optasports.com/media/690773/tab1-2014.xml"))

    doc.search('tournament').each do |tournament|

    name = "#{tournament['name']}"
    id = "#{tournament['id']}"

    tournament = {
      "name": name,
      "id": id,
    }

    Tournament.find_or_create_by(tournament)

    end

    @tournaments = Tournament.all
  end

  def show
    scrapper

    @selection_rank = 0

    @score_match_won = 0


  # @tournament.rounds.each do|round|
  #     round.matchs.each do |match|
  #   @picks.each do |pick|
  #       if pick.validated == true and pick.updated_at < match.match_date
  #       elsif pick.player.firstentrys.each do |firstentry|
  #         firstentry.match.score.winning_entry_id == firstentry.id
  #         @score_match_won += 10
  #         # raise
  #         end
  #       end
  #     end
  #   end
  # end

  @picks.each do |pick|
    if pick.validated == true
      pick.player.firstentrys.each do |firstentry|
        if firstentry.match.score.winning_entry_id == firstentry.id and pick.updated_at < firstentry.match.match_date
         @score_match_won += 10
        end
      end
      pick.player.secondentrys.each do |secondentry|
        if secondentry.match.score.winning_entry_id == secondentry.id and pick.updated_at < secondentry.match.match_date
         @score_match_won += 10
        end

        # raise
      end
    end
  end



    # @tournament.rounds.each do|round|
    #     if round.number == @tournament.rounds.size + 1  or round.number < @tournament.rounds.size + 1
    #     round.matchs.each do |match|
    #       match.firstentrys.each do |firstentry|
    #         if firstentry.player.picks.first.present? and firstentry.player.picks.first.validated?
    #           @score_match_won += 10
    #         end
    #       end
    #     end
    #   end
    # end


  end

  def score_match_won
    # @score_match_won = 0
    # @picks.each do |pick|
    #   if pick.validated == true
    #     pick.player.firstentrys.each do |firstentry|
    #       if firstentry.match.score.winning_entry_id = firstentry.id
    #       @score_match_won = 10
    #       raise
    #       end
    #     end
    #   end
    # end

    # render tournament
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def set_selections
    @selection = Selection.where(id: @tournament)
  end

  def set_pick
    @picks = Pick.where(selection_id: @tournament)
  end
end

