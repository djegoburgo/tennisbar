
def scrapper

  require 'nokogiri'

  scraped_tournament = @tournament.id.to_s + ".xml"

  file      = File.read(Rails.root.join('lib', 'seeds', scraped_tournament))
  document  = Nokogiri::XML(file)

  round = {}

  # récupération du tournament id pour s'assurer que l'on afficher les données du bon tournoi
  document.xpath('tournament').each do |tournament|
  tournoi_id = "#{tournament['id']}"

    # récupération des infos relatives au round

      Round.destroy_all
      Match.destroy_all
      Score.destroy_all
      Firstentry.destroy_all
      Secondentry.destroy_all
      # Player.destroy_all

        document.xpath('//round').each do |roundnode|
        name = "#{roundnode['name']}"
        number = "#{roundnode['number']}"
        round_id = "#{roundnode['id']}"

        round = {
          "id": round_id,
          "name": name,
          "number": number,
          "tournament_id": tournoi_id,
        }

        roundnode.xpath('match').each do |matchnode|
        match_id = "#{matchnode['id']}"
        match_date = "#{matchnode['date']}"

        match = {
          "id": match_id,
          "round_id": round_id,
          "match_date": match_date
        }

        matchnode.xpath('score').each do |scorenode|
        result_type = "#{scorenode['result_type']}"
        winning_entry_id = "#{scorenode['winning_entry_id']}"
        number_of_sets = "#{scorenode['number_of_sets']}"

        score = {
          "match_id": match_id,
          "result_type": result_type,
          "winning_entry_id": winning_entry_id,
          "number_of_sets": number_of_sets
        }

        matchnode.xpath('first_entry').each do |first_entrynode|
        firstentry_id = "#{first_entrynode['id']}"
        first_entrynode.xpath('player').each do |player|
        firstplayer_id = "#{player['id']}"

        firstentry = {
          "id": firstentry_id,
          "match_id": match_id,
          "player_id": firstplayer_id
        }

        matchnode.xpath('second_entry').each do |second_entrynode|
        secondentry_id = "#{second_entrynode['id']}"
        second_entrynode.xpath('player').each do |player|
        secondplayer_id = "#{player['id']}"

        secondtentry = {
          "id": secondentry_id,
          "match_id": match_id,
          "player_id": secondplayer_id
        }

        document.xpath('//player').each do |playernode|
        display_name = "#{playernode['display_name']}"
        player_id = "#{playernode['id']}"

        player = {
          "id": player_id,
          "display_name": display_name,
        }


        Round.find_or_create_by(round)
        Match.find_or_create_by(match) unless Match.exists?(id: match_id)
        Score.find_or_create_by(score)
        Firstentry.find_or_create_by(firstentry)
        Secondentry.find_or_create_by(secondtentry)
        Player.find_or_create_by(player) unless Player.exists?(id: player_id)


                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
