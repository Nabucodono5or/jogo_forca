# encoding: UTF-8

Dado /^que comecei um jogo$/ do
	start_new_game
end

Quando /^começo um novo jogo/ do
	start_new_game
end


Quando /^escolho que a palavra sorteada deverá ter "(.*?)" letras$/ do |number_of_letters|
	step %(I type "#{number_of_letters}") 
end

Quando /^termino o jogo$/ do
	step %(I type "fim")	
end

Então /^o jogo termina com a seguinte mensagem na tela:$/ do |text|
	step %(the stdout should contain "#{text}")

end

Dado /^o jogo tem as possíveis palavras para sortear:$/ do |word_table|
		words = word_table.rows.map(&:last).join(" ")
		set_rafflable_words(words)
end

Dado /^que escolhi que a palavra a ser sorteada deverá ter "(.*?)"\ letras$/ do 
|number_of_letters| 
	step %(I type "#{number_of_letters}")		
end

Quando /^tento advinhar que a palavra tem a letra "(.*?)"$/ do |letter|
	step %(I type "#{letter}")
# deveria receber a dada string e testar fim do jogo e não somente seu recebimento
end

Quando(/^tento adivinhar que a palavra tem a letra "(.*?)" "(.*?)" vezes$/) do |letter, number_of_guesses|
  
	number_of_guesses.to_i.times do
		step %(tento advinhar que a palavra tem a letra `#{letter}`)
	end
end

Então /^o jogo mostra que eu adivinhei uma letra com sucesso$/ do 
	step %(the output should contain "Você advinhou uma letra com sucesso.")
end

Então(/^o jogo mostra que eu errei a advinhação da letra$/) do
	step %(the stdout should contain "Você errou a letra.")
end

