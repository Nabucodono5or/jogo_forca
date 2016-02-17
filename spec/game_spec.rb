# encoding: UTF-8

require 'spec_helper'
require 'game'

describe Game do
	let(:word_raffler) { double("word_raffler").as_null_object }

	subject(:game) { Game.new(word_raffler) }	
	
	describe "#ended?" do
		it "returns false when the game just started" do
			expect(game).not_to be_ended	
		end	
	end

end

