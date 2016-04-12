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

		it "stays on the :initial state when a word can't be raffled" do
		   allow(word_raffler).to receive(:raffle).and_return(nil)

		   game.raffle(3)

		   expect(game.state).to eq(:initial)		
		end
	
	end
	

	describe "#finish" do
		it "sets the game as ended" do
		  game.finish

		  expect(game).to be_ended
		end	 	
	end

    describe "#guees_letter" do
		it "returns true if the raffled word contains the given letter" do
		  game.raffled_word = "hey"

		  expect(game).to receive(:guess_letter).with("h")
		  game.guess_letter("h")

		end

		it "saves the guessed letter wen te guess is right" do
		  game.raffled_word = "hey"

		  expect do
			game.guess_letter("h")
		  end.to change { game.guessed_letters }.from([]).to(["h"])	
		end

		it "returns false if the raffled word doesn't contain the given" << 
			"letter" do
		  game.raffled_word = "hey"

		  expect(game.guess_letter("z")).to be false

		end

		it "returns false if the given letter is an blank string" do
		  game.raffled_word = "hey"

		  expect(game.guess_letter("")).to be false
		  expect(game.guess_letter("  ")).to be false
			
		end
	end

	describe "#guessed_letters" do
		it "returns the guessed letters" do
		  game.raffled_word = "hey"
		  game.guess_letter("e")

		  expect(game.guessed_letters).to eq(["e"])	
		end  	
		
		it "returns an empty array when there's no guessed letters" do
		  game.guessed_letters
		  expect(game.guessed_letters).to eq([])
		end
	end

end

