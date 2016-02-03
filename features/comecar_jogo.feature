# language: pt

Funcionalidade: Começar jogo
	Para poder passar o tempo
	Como jogador
	Quero poder começar um novo jogo

	Cenário: Começo de novo jogo um sucesso
		Ao começar o jogo, é mostrada a mensagem inicial para o jogador.

		Quando começo um novo jogo
		Então o jogo termina com a seguinte mensagem na tela:
		 """
		 Bem vindo ao jogo da forca!
		 """

	@wip
	Cenário: Sorteio da palavra com sucesso
		Após o jogador começar, ele deve escolher o tamano da
		palavra a ser advinhada. Ao escolher o tamanho, o jogo sorteia a
		palavra e mostra  na tela um "-" para cada letra que a palavra
		sorteada tem.

		Dado que comecei um jogo
		Quando escolho que a palavra sorteada deverá ter "4" letras
		Então o jogo termina com a seguinte mensagem na tela:
			"""
			_ _ _ _
			"""

