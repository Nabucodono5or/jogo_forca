# encoding: UTF-8

require 'word_raffler'

class Game
	attr_accessor :raffled_word
	attr_accessor :state	
	attr_accessor :letters_advinhadas
	attr_reader :guessed_letters

# método incializador	
	def initialize(word_raffler = WordRaffler.new)
	  @word_raffler = word_raffler
	  @state = :initial
	  @guessed_letters = []
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

#método guess letter
	def guess_letter(letter)
	  return false if letter.strip == ''
	  @raffled_word.include?(letter)

=begin	  if @raffled_word.include?(letter)
		@guessed_letters << letter
		return true
	  else
		return false 
	  end
=end
	end

end
