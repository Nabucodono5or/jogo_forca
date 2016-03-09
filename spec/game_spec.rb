# encoding: UTF-8

require 'spec_helper'
require 'game'

describe Game do
	let(:word_raffler) { double("word_raffler").as_null_object }

	subject(:game) { Game.new(word_raffler) }

	context "when just created" do
		it "(:state) { should  == :initial}" do
			expect { subject.state(:initial) }		
		end	
	end	
	
	describe "#ended?" do
		it "returns false when the game just started" do
			expect(game).not_to be_ended	
		end	
	end
	
	describe "#raffle" do
		it "raffles a word with the given length" do
		  expect(word_raffler).to receive(:raffle)
		  
		  game.raffle(3)
		end

		it "saves the raffled word" do
		  raffled_word = "mom"
		  allow(word_raffler).to receive(:raffle).and_return(raffled_word)

		  game.raffle(3)
		
		  expect(game.raffled_word).to eq(raffled_word) 
		
		end

		it "makes a transition from :initial to :word_raffled on success" do 
		  allow(word_raffler).to receive(:raffle).and_return("word")
		  
		  expect do
			game.raffle(3)
		  end.to change { game.state }.from(:initial).to(:word_raffled)		
		end	
	end
	

	describe "#finish" do
		it "sets the game as ended" do
		  game.finish

		  expect(game).to be_ended
		end	 	
	end
end

