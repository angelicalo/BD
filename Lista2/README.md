A Federação de Futebol da Bachatóvia deseja construir um sistema de informação para melhor
organizar seus prestigiados campeonatos de futebol. Faça um diagrama de modelo de banco de
dados relacional para atender aos seguintes requisitos:


1 - Todo jogador que possa atuar no campeonato precisa estar cadastrado. O cadastro do jogador deve
incluir, nome, data de nascimento, número de registro na confederação (único para cada jogador),
nacionalidade e documento de identificação.

2 - Para cada treinador, é preciso registrar número de registro de treinador (único para cada treinador),
nome, documento de identificação, nacionalidade e formação.

3 - Todo estádio habilitado a receber jogos precisa estar cadastrado. Nesse cadastro, deve constar: nome
do estádio, capacidade, endereço e data de construção.

4 - Para cada time do campeonato é preciso registrar: nome, número de registro de clube (único para
cada time), endereço da sede, data de fundação e um treinador principal.

5 - Ao longo do ano, podem ocorrer diversos campeonatos. Para cada campeonato, deve ser registrado
um nome, um ano de realização e um regulamento. Os campeonatos são sempre de pontos corridos.

6 - É preciso registrar os times participantes de cada campeonato. No registro de um time X em um
campeonato Y, deve ser guardado uma classificação e uma pontuação para o time X no campeonato Y.

7 - Cada time pode inscrever um elenco de jogadores antes do início de cada campeonato. Ao longo de
cada campeonato, não podem ocorrer mudanças nesse elenco de jogadores. Assim, é preciso registrar
os jogadores que compõe o elenco de um time em um determinado campeonato. Note que a inscrição
de cada jogador em um time está condicionada a um campeonato.

8 - Cada partida ocorre entre dois times em um determinado campeonato. Para cada partida, é preciso
registrar o time mandante, o time visitante, o respectivo campeonato, data/hora de início da partida, o
estádio em que a partida foi realizada, a quantidade de público assistente, o placar de cada time e a
equipe de arbitragem responsável pela partida: o árbitro principal, o árbitro reserva, e os dois árbitros
auxiliares. Também é preciso armazenar a súmula de arbitragem de cada partida.

10 - Para cada árbitro, é preciso armazenar o número de registro de árbitro (único para cada árbitro),
nome, data de nascimento e nacionalidade. Todos os tipos de árbitro (principal, auxiliar ou reserva)
devem ser cadastrados na mesma tabela.

11 - Para cada partida, também é preciso registrar os jogadores que foram escalados para a partida, com
os respectivos números de camisa utilizados por cada um. É preciso discriminar se cada jogador era
inicialmente titular ou reserva. Se, em algum momento, qualquer jogador entrar em campo para
efetivamente jogar, é preciso registrar o momento do tempo de jogo em que o jogador entrou e o tempo
em que o mesmo saiu. Note que alguns reservas não chegam a entrar efetivamente em jogo.
continua na próxima página12 – Note que para um jogador ser relacionado para uma partida, é preciso que ele esteja cadastrado no
elenco de um dos times envolvidos na mesma para o respectivo campeonato. Do mesmo modo, cada
partida em um campeonato só pode ocorrer entre time cadastrados para o respectivo campeonato.

13 - Ainda para cada partida, é preciso registrar o momento em cada gol foi realizado, um tipo de gol (a
favor ou contra), o jogador responsável pelo gol, o time para qual o gol foi marcado e o momento do
tempo de jogo em que o gol foi feito.

14 - Para cada partida, também é preciso armazenar os jogadores que receberam cartões amarelos e
vermelhos, com uma justificativa para o cartão e o momento do tempo de jogo em que o cartão foi
assinalado.

15 – Note que apenas jogadores relacionados para uma partida podem marcar gols ou receber cartões
na mesma.
