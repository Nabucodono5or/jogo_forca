# encoding: UTF-8

require 'word_raffler'

class Game
	attr_reader :raffled_word	

# método incializador	
	def initialize(word_raffler = WordRaffler.new)
	  @word_raffler = word_raffler
          @ended = false
	end


# método raffle
	def raffle(word_length)
	  @raffled_word = @word_raffler.raffle(word_length)
	end


#método ended?
	def ended?
	  @ended
	end

# método temporário finish
	def finish
	  @ended = true	
	end

end
