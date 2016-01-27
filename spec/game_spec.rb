# encoding: UTF-8

require 'spec_helper'
require 'game'

describe Game do
	describe "#start" do
		it "imprima a memssagem inicial" do
			game = Game.new
			
			game.start

			initial_message = "Bem vindo ao jogo da forca!"
			STDOUT.should include(initial_message)
		end
	end
end

