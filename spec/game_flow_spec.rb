# encoding: UTF-8

require 'spec_helper'
require 'game_flow'

describe GameFlow do
	let(:ui) { double("ui").as_null_object }
	let(:game) { double("game",state: :initial).as_null_object }

	subject(:game_flow) { GameFlow.new(game,ui) }

# retirado do teste da classe game
		describe "#start" do
		it "imprima a memssagem inicial" do
			initial_message = "Bem vindo ao jogo da forca!"
			
			expect(ui).to receive(:write).and_return(initial_message)
			
			game_flow.start
		end
	end

# retirado do teste da classe game
	describe "#next_step" do
		context "when the game just started" do
			it "asks the player for the length of the word to be raffled" do
				question = "Qual o tamanho da palavra a ser sorteada?"
				allow(ui).to receive(:write).and_return(question) 								
				word_length = "3"
				expect(ui).to receive(:read).and_return(word_length) 								
				game_flow.next_step
			end
			
			it "finishes the game when the player asks to" do
				player_input = "fim"
				allow(ui).to receive(:read).and_return(player_input)

				expect(game).to receive(:finish)
				
				game_flow.next_step			
			end
		
		end

		context "when the player asks to raffle a word" do
			it "raffles a word with the given length" do
				word_length = "3"
				allow(ui).to receive(:read).and_return(word_length)

				expect(game).to receive(:raffle)
				
				game_flow.next_step			
			end

			it "prints a '_' for each letter in the raffled word" do
				word_length = "3"
				allow(ui).to receive(:read).and_return(word_length)
				allow(game).to receive(:raffle).and_return("mom") 					# pode haver problema na permissão acima, se assim for faça:
				# game.stub(raffle: "mom", raffled_word: "mom")

				expect(ui).to receive(:write).and_return("_ _ _")

				game_flow.next_step	
		
			end
			
			it "tells if it's not possible to raffle with the given length" do
				word_length = "20"
				allow(ui).to receive(:read).and_return(word_length)
				allow(game).to receive(:raffle).and_return(nil)

				error_message = "Não temos uma palavra como tamanho " <<
				"desejado, \n" <<
				"é necessário escolher outro tamanho."
				
				expect(ui).to receive(:write).and_return(error_message)

				game_flow.next_step
			end	

		end
		
		context "When the player guess a letter with success" do
			it "prints a success message" do
				allow(game).to receive_messages(:state => :word_raffled, :guess_letter => true)
								
				success_message = "Você advinhou uma letra com sucesso."
				expect(ui).to receive(:write).and_return(success_message)
				
				game.next_step
			
			end			
		end
	
	end	


end
