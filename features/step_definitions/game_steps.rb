# encoding: UTF-8

Quando /^começo um novo jogo/ do
	steps %{
	When I run 'forca' interactively
	}
end

Então /^vejo na tela:$/ do |string|
	steps %{
		Then the stdout should contain "#{string}"	
	}
end
