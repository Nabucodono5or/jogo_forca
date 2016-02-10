# encoding: UTF-8

require 'spec_helper'
require 'game'

describe Game do
	let(:ui) { double("ui").as_null_object }
	subject(:game) { Game.new(ui) }	
	
	describe "#start" do
		it "imprima a memssagem inicial" do
			initial_message = "Bem vindo ao jogo da forca!"
			
			expect(ui).to receive(:write).and_return(initial_message)
			
			game.start
		end
	end

	describe "#ended?" do
		it "returns false when the game just started" do
			expect(game).not_to be_ended	
		end	
	end

	describe "#next_step" do
		context "when the game just started" do
			it "asks the player for the length of the word to be raffled" do
				question = "Qual o tamanho da palavra a ser sorteada?"
				allow(ui).to receive(:write).and_return(question) 								
				word_length = "3"
				expect(ui).to receive(:read).and_return(word_length) 								
				game.next_step
			end
			
			it "finishes the game when the player asks to" do
				player_input = "fim"
				allow(ui).to receive(:read).and_return(player_input)

				game.next_step

				expect(game).to be_ended			
			end
		
		end

		context "when the player asks to raffle a word" do
			it "raffles a word with the given length" do
				word_length = "3"
				allow(ui).to receive(:read).and_return(word_length)

				game.next_step

				expect(game.raffled_word.length).to eq(word_length.to_i)
			end

			it "prints a '_' for each letter in the raffled word" do
				word_length = "3"
				allow(ui).to receive(:read).and_return(word_length)
				
				expect(ui).to receive(:write).and_return("_ _ _")

				game.next_step	
		
			end
			
			it "tells if it's not possible to raffle with the given length" do
				word_length = "20"
				allow(ui).to receive(:read).and_return(word_length)

				error_message = "Não temos uma palavra como tamanho " <<
				"desejado, \n" <<
				"é necessário escolher outro tamanho."
				
				expect(ui).to receive(:write).and_return(error_message)

				game.next_step
			end	

		end
	
	end	
end

