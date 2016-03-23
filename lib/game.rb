# encoding: UTF-8

require 'word_raffler'

class Game
	attr_accessor :raffled_word
	attr_accessor :state	

# método incializador	
	def initialize(word_raffler = WordRaffler.new)
	  @word_raffler = word_raffler
	  @state = :initial
	end


# método raffle
	def raffle(word_length)
	  if @raffled_word = @word_raffler.raffle(word_length)
	    @state = :word_raffled
	  end
	end


#método ended?
	def ended?
	  @state == :ended
	end

# método temporário finish
	def finish
	  @state = :ended	
	end

end
