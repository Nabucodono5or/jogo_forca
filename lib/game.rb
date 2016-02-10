# encoding: UTF-8

require_relative 'cli_ui'

class Game
	attr_reader :raffled_word	

# método incializador	
	def initialize( ui = CLiUi.new)
	  @ui = ui
          @ended = false
	end

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

		  if raffle_word(player_input.to_i)
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
# método privado raffle_word
	def raffle_word(word_length)
	  words = %w(hi mom game fruit)
	  @raffled_word = words.detect { |word| word.length == word_length }	
	end

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
