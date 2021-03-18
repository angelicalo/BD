Exercício 1
Construa  um  modelo  de  dados  relacional  que  atenda  aos  seguintes requisitos de um berçário:

1)É necessário manter um cadastro dos pais com nome, RG, sexo, data de nascimento, telefone e endereço;

2)A cada bebê que nasce, registra-se nome, data/hora de nascimento, sexo, peso, altura, tipo de parto, pai (quando conhecido) e mãe;

3)Para cada profissional de saúde, são armazenados nome, RG, CPF, data de nascimento, registro de ordem (se houver) e um dos cargos pré-cadastrados em uma relação de cargos;

4)É preciso cadastrar quais os profissionais envolvidos no nascimento de cada bebê.

Exercício 2
Construa um modelo de dados relacional que atenda aos seguintes requisitos de uma loja de eletrodomésticos:

1)É necessário manter um cadastro dos funcionários armazenando nome, CPF, data de nascimento, endereço, telefone, cargo e conta bancária. Cada funcionário está sujeito a supervisão de um único outro funcionário em cargo superior. 

2)Os produtos vendidos na loja possuem um código único, um título, um fabricante, um modelo e um texto com especificações;

3)A loja repõe o estoque de produtos através de lotes de compra. Em cada lote de compra, é comprada uma determinada quantidade de um único produto. É necessá-rio armazenar o produto comprado em cada lote com sua respectiva quantidade e preço unitário de compra, a data da compra e quantidade do produto obtido no res-pectivo lote ainda disponível no estoque;

4)Deve-se manter um cadastro dos clientes com nome, CPF, data de nascimento, ende-reço e telefone;

5)A cada venda, é preciso gerar e armazenar o número da nota fiscal, a data/hora da venda, a forma de pagamento, o endereço de entrega, o cliente responsável e o fun-cionário que realizou a venda. Para cada venda, também é preciso saber os produtos vendidos, com seus respectivos lotes de compra, quantidades vendidas e preços uni-tários de venda. Observe que diversos produtos podem ser vendidos em uma mesma venda sob a mesma nota fiscal;
