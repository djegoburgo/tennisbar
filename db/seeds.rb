
require 'nokogiri'

#     Round.destroy_all

    file      = File.read(Rails.root.join('lib', 'seeds', 'chennai04_tournament.xml'))
    document  = Nokogiri::XML(file)
#     # csv_text = File.read(Rails.root.join('lib', 'seeds', 'real_estate_transactions.csv'))

#     round = {}

#     document.xpath('tournament').each do |tournament|
#        tournoi_id = "#{tournament['id']}"

#        # p tournoi_id

#     document.xpath('//round').each do |round|

#     name = "#{round['name']}"
#     number = "#{round['number']}"
#     id = "#{round['id']}"


#     round = {
#       # "id": id,
#       "name": name,
#       "number": number,
#       "tournament_id": 8449,
#     }

#     Round.create(round)
#
#

      document.xpath('//match').each_with_index do |match, 1|

        id = "#{match['id']}"

        match = {
          "id": id
        }

        p match

end
