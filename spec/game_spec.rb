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
end

