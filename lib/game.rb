# encoding: UTF-8

class Game
	def initialize( output = STDOUT)
		@output = output
        @ended = false
	end

	def start
		initial_message = "Bem vindo ao jogo da forca!"
		@output.puts initial_message
		@ended = true	
	end
	
	def ended?
		@ended	
	end
end
