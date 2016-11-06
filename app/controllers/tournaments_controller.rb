class TournamentsController < ApplicationController

  before_action :set_tournament, only: [:show, :search_rounds]


  def index
    require 'open-uri'
    require 'nokogiri'

    Tournament.destroy_all

    doc = Nokogiri::HTML(open("http://optasports.com/media/690773/tab1-2014.xml"))

    tournament = {}

    doc.search('tournament').each do |tournament|

    name = "#{tournament['name']}"
    id = "#{tournament['id']}"

    tournament = {
      "name": name,
      "id": id,
    }

    Tournament.create(tournament)

    end

    @tournaments = Tournament.all

  end


  def show
    # render 'rounds_controller/index'
    # redirect_to tournament_rounds_path(@tournament.id)
     @tournament = Tournament.find(params[:id])

    require 'nokogiri'

    Round.destroy_all

    file      = File.read(Rails.root.join('lib', 'seeds', 'chennai04_tournament.xml'))
    document  = Nokogiri::XML(file)

    round = {}

    # récupération du tournament id pour s'assurer que l'on afficher les données du bon tournoi
    document.xpath('tournament').each do |tournament|
    tournoi_id = "#{tournament['id']}"

      # récupération des infos relatives au round
      document.xpath('//round').each do |round|

      name = "#{round['name']}"
      number = "#{round['number']}"
      # id = "#{round['id']}"
      round_id = "#{round['id']}"

      # countruction du round depuis les infos scrappées
      round = {
        "id": round_id,
        "name": name,
        "number": number,
        "tournament_id": @tournament.id,
      }

        # if tournoi_id.to_i == @tournament.id
        Round.create(round)
        #       end
        Match.destroy_all

        document.xpath('///match').each do |match|

        match_id = "#{match['id']}"

        match = {
          "id": match_id,
          "round_id": round_id
        }

        # if tournoi_id.to_i == @tournament.id
        # Round.create(round)
        Match.create(match)
          end
        end
    end
    @rounds = Round.all
    @match = Match.all
  end


  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

end
