

class Card

	attr_reader :value
	attr_reader :suit


	def initialize(data)
		@value = data['value']
		@suit = data['suit']
	end

	def self.generate(data_list)
		data_list.collect { |card_hash| Card.new(card_hash) } 
	end 


	def to_s()
		"#{@value} #{@suit}"
	end

end