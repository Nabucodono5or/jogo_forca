# encoding: UTF-8

require 'cli_ui'
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


# métodos a serem retirados para outra classe
# método start
	def start
	  initial_message = "Bem vindo ao jogo da forca!"
	  @ui.write initial_message	
	end

# método ended	
	def ended?
	  @ended	
	end

# método next_step
	def next_step
	  @ui.write("Qual o tamanho da palavra a ser sorteada?")
	  player_input = @ui.read.strip

	  if player_input == "fim"
		@ended = true		
		else

		  if @raffled_word = @word_raffler.raffle(player_input.to_i)
			print_letters_feedback
			else
				
			  error_message = "Não temos uma palavra com o tamanho " <<
					  "desejado,\n" <<
					  "é necessário escolher outro tamanho."

			  @ui.write(error_message)
			end
		end
	end


	private
#método privado print_letters_feedback
	def print_letters_feedback
	  letters_feedback = ""
		
	  @raffled_word.length.times do
		letters_feedback << "_ "
	  end
		
	  letters_feedback.strip!
	  @ui.write(letters_feedback)
		
	end
end
