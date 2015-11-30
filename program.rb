require 'net/http'
require 'json'

require_relative('card')

host = 'deckofcardsapi.com'

puts "Fetching cards..."

response = Net::HTTP.get(host, '/api/deck/new/shuffle/?deck_count=1')

# puts "The string response is: "
# puts response

response_hash = JSON.parse(response)

deck_id = response_hash['deck_id']
puts "The key is: "
puts deck_id

response = Net::HTTP.get(host, "/api/deck/#{deck_id}/draw/?count=10")

# puts response
response_hash = JSON.parse(response)
cards_hash = response_hash['cards']

# cards = []
# cards_hash.each do | card_hash |
# 	cards << Card.new(card_hash)
# end

cards = Card.generate(cards_hash)

# cards = cards_hash.collect { |card_hash| Card.new(card_hash) } 
cards.each { | card | puts "#{card}" }


# puts "#{card_hash['value']} #{card_hash['suit']}"
