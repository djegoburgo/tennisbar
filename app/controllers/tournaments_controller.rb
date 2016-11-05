class TournamentsController < ApplicationController

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

  end

end
