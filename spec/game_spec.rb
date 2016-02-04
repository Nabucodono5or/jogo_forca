# encoding: UTF-8

require 'spec_helper'
require 'game'

describe Game do
	let(:output) { double("output") }
	subject(:game) { Game.new(output) }	
	
	describe "#start" do
		it "imprima a memssagem inicial" do
			initial_message = "Bem vindo ao jogo da forca!"
			output.should_receive(:puts).with(initial_message)
			
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
				output.should_receive(:puts).with(question)

				game.next_step
			end		
		end	
	end	
end

