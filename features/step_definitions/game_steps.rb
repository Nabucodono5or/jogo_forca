# encoding: UTF-8

Dado /^que comecei um jogo$/ do
	start_new_game
end

Quando /^começo um novo jogo/ do
	start_new_game
end


Quando /^escolho que a palavra sorteada deverá ter "(.*?)" letras$/ do |number_of_letters|
	steps %{
		When I type "#{number_of_letters}"
	} 
end

Quando /^termino o jogo$/ do
	steps %{
		When I type "fim" 	
	}
end

Então /^o jogo termina com a seguinte mensagem na tela:$/ do |text|
	steps %{
		Then the stdout should contain:
		"""
		#{text}
		"""	
		And then the exit status should be 0
	}

end

Dado /^o jogo tem as possíveis palavras para sortear:$/ do |word_table|
	words = word_table.rows.map(&:last).join(" ")
	set_rafflable_words(words)
end

Dado /^que escolhi que a palavra a ser sorteada deverá ter "(.*?)"\ letras$/ do 
|number_of_letters| 
	steps %{
	  When I type "#{number_of_letters}"
	}		
end

Quando /^tento advinhar que a palavra tem a letra "(.*?)"$/ do |letter|
	steps %{
	  When I type "#{letter}"
	}
end

Então /^o jogo mostra que eu adivinhei uma letra com sucesso$/ do
	steps %{
	  Then the stdout should contain:
	     """
	     Você adivinhou uma letra com sucesso.
             """
	}

end

