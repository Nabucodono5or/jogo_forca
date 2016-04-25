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


		it "saves the guessed letter when the guess is right" do
		  game.raffled_word = "hey"
		  game.guess_letter("h")

		  expect do
			game.guess_letter("h")
		  end.to_not change { game.guessed_letters }.from(["h"])
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

		it "makes a transition to the 'ended' state when all the letters "<<
			"are guessed with success" do
			game.state = :word_raffled
			game.raffled_word = "hi"

			expect do
			  game.guess_letter("h")
			  game.guess_letter("i")
			end.to change { game.state }.from(:word_raffled).to(:ended)
		end

		it "maes a transition to the end 'ended' state when te player "<<
			"miss 6 times trying to guess a latter " do
			game.state = :word_raffled
			game.raffled_word = "hi"

			expect do
			  6.times { game.guess_letter("z") }
			end.to change { game.state }.from(:word_raffled).to(:ended)	
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

	describe "#missed_parts" do
		it "returns an empty array when there's no missed parts" do
		  expect(game.missed_parts).to eq([])
		end

		it "returns the missed parts for each fail in guessing a letter" do
		  game.raffled_word = "hey"

		  3.times do
			game.guess_letter("z")
		  end

		  expect(game.missed_parts).to eq(["cabeça", "corpo", "braço esquerdo"])
		end

		it "updates the missed parts when the guess is wrong" do
		  game.raffled_word = "hey"

		  game.guess_letter("z")

		  expect(game.missed_parts).to eq(["cabeça"])
		end
	end

	describe "#player_won?" do
		it "returns true whhen the player guessed all letters with success" do
		  game.state = :word_raffled
		  game.raffled_word = "hi"

		  game.guess_letter("h")
		  game.guess_letter("i")

		  expect(game.player_won?).to be true
		end

		it "returns false when te player didn't guessed all letters" do
		  game.state = :word_raffled
		  game.raffled_word = "hi"

		  6.times { game.guess_letter("z") }

		  expect(game.player_won?).to be false
		end

		it "returns false when the game is not in the 'ended' state" do
		  game.state = :initial
		  expect(game.player_won?).to be false

		  game.state = :word_raffled
		  expect(game.player_won?).to be false
		end 
	end

end

