# encoding: UTF-8

Quando /^começo um novo jogo/ do
	start_new_game
end

Então /^vejo na tela:$/ do |string|
	steps %{
		Then the stdout should contain "#{string}"	
	}
end

Dado /^que comecei um jogo$/ do
	start_new_game
end

Quando /^escolho que a palavra sorteada deverá ter "(.*?)" letras\$/ do |number_of_letters|
	steps %{
		When I type "#{number_of_letters}"
	} 
end
