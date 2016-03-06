# language: pt

Funcionalidade: Advinhar letra
	Após a palavra do jogo ser sorteada, o jogador pode começar a tentar
	advinhar as letras da palavra.

	Cada vez que ele acerta uma letra, o jogo mostra para ele em que 
	posição dentro da palavra está a letra que ele acertou.

	Cada vez que o jogador erra uma letra, uma parte do boneco da 
	forca aparece na forca. O jogador pode errar no máximo seis vezes, que
	correspondem às seis partes do boneco: cabeça, corpo, braço equerdo, 
	braço direito, perna esquerda, perna direita.

	Contexto:
	  * o jogo tem as possíveis palavras para sortear:
		| número de letras | palavra sorteada |
		| 3                | avo              |

	@wip
	Cenário: Sucesso ao advinhar letra
	  Se o jogador advinhar a letra com sucesso, o jogo mostra uma
	  mensagem de sucesso e mostra em que posição está a leta que o 
	  jogador advinhou.

	  Dado que comecei um jogo
	  E que escolhi que a palavra a ser sorteada deverá ter "3" letras
	  Quando tento advinhar que a palavra tem a letra "a"
	  E termino o jogo
	  Então o jogo mostra que eu adivinhei uma letra com sucesso
	  E o jogo termina com a seguinte mensagem na tela:
	    """
	    a _ _
            """

	Cenário: Erro ao advinhar letra
	  Se o jogador errar ao tentar advinhar a letra, o jogo mostra uma 
	  mensagem de erro e mostra quais as parte o boneco da forca já 
	  perdeu.

	Cenário: Jogador advinha com sucesso duas vezes
	  Quanto mais o jogador for acertando, mais o jogo vai mostrando para 
	  ele as letras que ele advinhou.

	Cenário: Jogador erra três vezes ao advinhar letra
	  Quanto mais o jogador for errando, mais partes do boneco da forca 
	  são perdidas.

