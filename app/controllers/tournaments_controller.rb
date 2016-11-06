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

    document.xpath('tournament').each do |tournament|
       tournoi_id = "#{tournament['id']}"

    document.xpath('//round').each do |round|

     name = "#{round['name']}"
     number = "#{round['number']}"
     id = "#{round['id']}"

    round = {
      "id": id,
      "name": name,
      "number": number,
      "tournament_id": @tournament.id,
    }

    if tournoi_id.to_i == @tournament.id
    Round.create(round)

        end
      end
    end
    @rounds = Round.all
  end


  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

end
