# encoding: UTF-8

require 'word_raffler'

class Game
	HANGMAN_PARTS = ["cabeça", "corpo", "braço esquerdo", "braço direito", "perna esquerda", "perna direita"]

	attr_accessor :raffled_word
	attr_accessor :state	
	attr_accessor :letters_advinhadas
	attr_reader :guessed_letters
    attr_reader :missed_parts

# método incializador	
	def initialize(word_raffler = WordRaffler.new)
	  @word_raffler = word_raffler
	  @state = :initial
	  @guessed_letters = []
	  @missed_parts = []
	  @wrong_guesses = 0
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

	  if @raffled_word.include?(letter)
		@guessed_letters << letter
		@guessed_letters.uniq!
		return true
	  else
		@missed_parts << HANGMAN_PARTS[@wrong_guesses]
		@wrong_guesses += 1
		return false 
	  end
	end

end
