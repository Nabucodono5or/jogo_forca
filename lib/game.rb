# encoding: UTF-8

require 'word_raffler'

class Game
	attr_accessor :raffled_word
	attr_accessor :state	
	attr_accessor :letters_advinhadas

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

#método guess letter
#o ideal é que tenhha um variável de instancia com todas as letras advinhadas
	def guess_letter(letter)

	  if @raffled_word.include?(letter)
		if @letters_advinhadas
		 @letters_advinhadas << letter
		else
		 @letters_advinhadas = letter
		end
		return true

	 else
		return false
	 end

	end

end
