# encoding: UTF-8

require 'spec_helper'
require 'game'

describe Game do
	let(:ui) { double("ui").as_null_object }
	subject(:game) { Game.new(ui) }	
	
	describe "#start" do
		it "imprima a memssagem inicial" do
			initial_message = "Bem vindo ao jogo da forca!"
			ui.should_receive(:write).with(initial_message)
			
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
				ui.should_receive(:write).with(question)

				ui.should_receive(:read)
				
				game.next_step
			end
			
			it "finishes the game when the player asks to" do
				player_input = "fim"
				ui.stub(read: player_input)

				game.next_step

				expect(game).to be_ended			
			end
		
		end	
	end	
end

