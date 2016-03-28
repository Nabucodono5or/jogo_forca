# encoding: UTF-8

require 'game'
require 'cli_ui'
require 'forwardable'

# Esta classe é responsável pelo fluxo do jogo.
#
class GameFlow
	extend Forwardable
	delegate :ended? => :@game

	def initialize(game = Game.new, ui = CLiUi.new)
	  @game = game
	  @ui = ui
	end

# método start
	def start
	  initial_message = "Bem vindo ao jogo da forca!"
	  @ui.write initial_message	
	end

# método next_step
	def next_step
	  case @game.state
	  when :initial
		ask_to_raffle_a_word
	  when :word_raffled
		ask_to_guess_a_letter
	  end
	end

	private
#método privado ask_to_raffle_a_word
    def ask_to_raffle_a_word
   	  @ui.write("Qual o tamanho da palavra a ser sorteada?")
	  player_input = @ui.read.strip

	  if player_input == "fim"
		@game.finish		
		else
		  if @raffled_word = @game.raffle(player_input.to_i)
			@ui.write(guessed_letters)
			else	
			  error_message = "Não temos uma palavra com o tamanho " <<
					  "desejado,\n " <<
					  "é necessário escolher outro tamanho."

			  @ui.write(error_message)
			end
		end

    end

#método privado ask_to_guess_a_letter
	def ask_to_guess_a_letter
	  @ui.write("Qual letra você acha que a palavra tem?")
	  letter = @ui.read.strip

	  if @game.guess_letter(letter)
		@ui.write("Você advinhou uma letra com sucesso.")
		@ui.write(guessed_letters)
	  end	
	end

#método privado print_letters_feedback
=begin
	def print_letters_feedback
	  letters_feedback = ""
		
	  @game.raffled_word.length.times do
		letters_feedback << "_ "
	  end
		
	  letters_feedback.strip!
	  @ui.write(letters_feedback)
		
	end
=end

# método guessed_letters
	def guessed_letters
	  letters = ""

	  @game.raffled_word.each_char do |letter|
	  	if @game.guessed_letters.include?(letter)
		  letters << letter + " "
		else
		  letters << "_ "
		end
	  end

	  letters.strip!				
	end

end
